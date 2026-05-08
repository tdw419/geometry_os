; DESCRIPTION: Render a colored object at the screen.

; netmon.asm -- Phase 141: Network Packet Viewer
;
; Visual network packet monitor. Reads from /dev/net device,
; displays scrolling packet log with hex data and rate stats.
; Simulates traffic by writing random data to the net port.
;
; Layout:
;   Row 0-1: Title bar
;   Row 2-29: Scrolling packet log (colored bars per packet)
;   Row 30-31: Status bar with packet count and rate
;
; Opcodes: LDI, MOV, ADD, SUB, MUL, DIV, AND, OR, SHL, SHR, SAR
;          MOD, CMP, JZ, JNZ, BLT, BGE, JMP, FILL, RECTF, PSET
;          DRAWTEXT, TEXT, IKEY, RAND, FRAME, OPEN, READ, IOCTL
;          STORE, LOAD

; == INIT ==
    LDI r9, 1
    LDI r1, 0
    LDI r0, 0             ; total packets
    LDI r10, 0            ; rate counter
    LDI r14, 0            ; displayed rate
    LDI r8, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r3, net_path
    LDI r13, 0
    OPEN r3, r13
    MOV r7, r6            ; r7 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r3, 0x080810
    FILL r3

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r3, 0xFFE
    LOAD r3, r3
    LDI r13, 31
    AND r3, r13
    LDI r13, 15
    CMP r3, r13
    JNZ r6, no_sim
    RAND r3
    LDI r13, 0xFFC
    STORE r13, r3
no_sim:

    ; == READ FROM /dev/net ==
    LDI r3, 0xFFC
    LDI r13, 1
    READ r7, r3, r13
    LDI r3, 0
    CMP r6, r3
    JZ r6, no_pkt

    ; Store packet
    LDI r3, 0xFFC
    LOAD r24, r3           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r3, r8
    LDI r13, 2
    SHL r3, r13
    MOV r13, r22
    ADD r13, r3
    STORE r13, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r3, r9
    ADD r13, r3
    MOV r11, r24
    LDI r15, 24
    SHR r11, r15             ; top byte
    STORE r13, r11

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r3, r9
    ADD r13, r3
    LDI r11, 0xFFE
    LOAD r11, r11
    STORE r13, r11

    ; Advance head
    ADD r8, r9
    LDI r3, 32
    CMP r8, r3
    BLT r6, no_wrap
    LDI r8, 0
no_wrap:
    ADD r0, r9
    ADD r10, r9

no_pkt:
    ; == RATE UPDATE ==
    LDI r3, 0xFFE
    LOAD r2, r3
    LDI r3, 63
    AND r2, r3
    LDI r3, 2
    CMP r2, r3
    BGE r6, no_rate
    MOV r14, r10
    LDI r10, 0
no_rate:

    ; == TITLE BAR ==
    LDI r3, 0
    LDI r13, 0
    LDI r11, 256
    LDI r15, 14
    LDI r5, 0x003366
    RECTF r3, r13, r11, r15, r5

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r3, 0xE003
    LDI r13, 0
    LDI r11, 0
    IOCTL r3, r13, r11
    LDI r3, 0
    CMP r6, r3
    JZ r6, net_down_label

    ; Net status indicator
    LDI r16, 90
    LDI r17, 3
    LDI r18, up_str
    LDI r19, 0x00FF00
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20
    JMP pkt_draw

net_down_label:
    LDI r16, 90
    LDI r17, 3
    LDI r18, down_str
    LDI r19, 0xFF0000
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

pkt_draw:
    ; == DRAW PACKET LOG ==
    ; Show last 28 packets as colored bars
    LDI r25, 0             ; display row (0-27)
    LDI r17, 16            ; start y

pkt_row:
    LDI r3, 0
    CMP r0, r3
    JZ r6, show_empty

    ; Determine entry index
    LDI r3, 28
    CMP r0, r3
    BGE r6, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r0
    BLT r6, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r3, r8
    LDI r13, 28
    SUB r3, r13
    ADD r3, r25
    LDI r13, 31
    AND r3, r13

do_draw_entry:
    ; r3 = entry index
    LDI r13, 2
    SHL r3, r13             ; entry * 4
    MOV r11, r22
    ADD r11, r3             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r13, r11
    ADD r13, r9
    LOAD r5, r13           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r15, 0xE0
    AND r5, r15            ; top 3 bits
    LDI r15, 5
    SHR r5, r15            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r15, 0x44
    OR r5, r15             ; ensure minimum brightness

    ; Draw row bar
    LDI r3, 2
    LDI r13, 256
    LDI r15, 7
    RECTF r3, r17, r13, r15, r5

    ; Draw a bright accent line on left
    MOV r3, r11
    LOAD r4, r3           ; data word
    LDI r2, 16
    SHR r4, r2
    LDI r2, 0xF
    AND r4, r2
    LDI r2, 2
    MUL r4, r2
    ADD r4, r9             ; width = 3..33
    LDI r2, 0x00CCFF      ; cyan accent
    RECTF r3, r17, r4, r15, r2

skip_row:
    LDI r3, 8
    ADD r17, r3
    ADD r25, r9
    LDI r3, 28
    CMP r25, r3
    BLT r6, pkt_row
    JMP draw_stat

show_empty:
    LDI r16, 80
    LDI r17, 130
    LDI r18, empty_str
    LDI r19, 0x555555
    LDI r20, 0
    DRAWTEXT r16, r17, r18, r19, r20

draw_stat:
    ; == STATUS BAR ==
    LDI r3, 0
    LDI r13, 242
    LDI r11, 256
    LDI r15, 14
    LDI r5, 0x002244
    RECTF r3, r13, r11, r15, r5

    ; Build "PKT:N" at 0x6000
    LDI r3, 0x6000
    LDI r5, 80            ; 'P'
    STORE r3, r5
    ADD r3, r9
    LDI r5, 75
    STORE r3, r5
    ADD r3, r9
    LDI r5, 84
    STORE r3, r5
    ADD r3, r9
    LDI r5, 58
    STORE r3, r5
    ADD r3, r9
    LDI r5, 32
    STORE r3, r5
    ADD r3, r9

    ; Decimal convert r0
    MOV r13, r0
    LDI r11, 0x6020
    LDI r5, 0
    STORE r11, r5
    ; Special case: if r0 == 0, write '0'
    LDI r5, 0
    CMP r13, r5
    JNZ r6, dec_nonzero
    LDI r5, 48
    SUB r11, r9
    STORE r11, r5
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r13
    DIV r28, r27
    MUL r28, r27
    MOV r29, r13
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r11, r9
    STORE r11, r29
    LDI r28, 10
    DIV r13, r28
    LDI r28, 0
    CMP r13, r28
    JNZ r6, dec_nonzero
dec_copy:
    LDI r3, 0x6005
dec_cp:
    LOAD r13, r11
    LDI r27, 0
    CMP r13, r27
    JZ r6, dec_cp_done
    STORE r3, r13
    ADD r3, r9
    ADD r11, r9
    JMP dec_cp
dec_cp_done:
    LDI r5, 0
    STORE r3, r5

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r3, 0x6030
    LDI r5, 82
    STORE r3, r5
    ADD r3, r9
    LDI r5, 65
    STORE r3, r5
    ADD r3, r9
    LDI r5, 84
    STORE r3, r5
    ADD r3, r9
    LDI r5, 69
    STORE r3, r5
    ADD r3, r9
    LDI r5, 58
    STORE r3, r5
    ADD r3, r9
    LDI r5, 32
    STORE r3, r5
    ADD r3, r9

    ; Decimal convert r14
    MOV r13, r14
    LDI r11, 0x6050
    LDI r5, 0
    STORE r11, r5
    LDI r5, 0
    CMP r13, r5
    JNZ r6, rdec_nonzero
    LDI r5, 48
    SUB r11, r9
    STORE r11, r5
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r13
    DIV r28, r27
    MUL r28, r27
    MOV r29, r13
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r11, r9
    STORE r11, r29
    LDI r28, 10
    DIV r13, r28
    LDI r28, 0
    CMP r13, r28
    JNZ r6, rdec_nonzero
rdec_copy:
    LDI r3, 0x6037
rdec_cp:
    LOAD r13, r11
    LDI r27, 0
    CMP r13, r27
    JZ r6, rdec_done
    STORE r3, r13
    ADD r3, r9
    ADD r11, r9
    JMP rdec_cp
rdec_done:
    LDI r5, 47
    STORE r3, r5
    ADD r3, r9
    LDI r5, 115
    STORE r3, r5
    ADD r3, r9
    LDI r5, 0
    STORE r3, r5

    LDI r16, 130
    LDI r17, 244
    LDI r18, 0x6030
    LDI r19, 0xFFFF00
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    FRAME
    JMP main_loop

; == DATA ==
.org 0x4000
net_path:
    .asciz "/dev/net"
    .db 0

title_str:
    .asciz "NETMON - Packet Viewer"
    .db 0

up_str:
    .asciz "UP"
    .db 0

down_str:
    .asciz "DOWN"
    .db 0

empty_str:
    .asciz "NO PACKETS YET"
    .db 0
