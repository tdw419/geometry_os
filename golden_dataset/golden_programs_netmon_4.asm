; DESCRIPTION: This GeOS assembly code implements a network packet viewer that reads from the `/dev/net` device, displays a scrolling log of packets with hex data and rate statistics, and simulates traffic by writing random data to the net port. The interface includes a title bar, a scrolling packet log area, and a status bar showing packet count and rate.

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
    LDI r15, 0
    LDI r4, 0             ; total packets
    LDI r14, 0            ; rate counter
    LDI r1, 0            ; displayed rate
    LDI r6, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r10, net_path
    LDI r3, 0
    OPEN r10, r3
    MOV r8, r7            ; r8 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r10, 0x080810
    FILL r10

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r10, 0xFFE
    LOAD r10, r10
    LDI r3, 31
    AND r10, r3
    LDI r3, 15
    CMP r10, r3
    JNZ r7, no_sim
    RAND r10
    LDI r3, 0xFFC
    STORE r3, r10
no_sim:

    ; == READ FROM /dev/net ==
    LDI r10, 0xFFC
    LDI r3, 1
    READ r8, r10, r3
    LDI r10, 0
    CMP r7, r10
    JZ r7, no_pkt

    ; Store packet
    LDI r10, 0xFFC
    LOAD r24, r10           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r10, r6
    LDI r3, 2
    SHL r10, r3
    MOV r3, r22
    ADD r3, r10
    STORE r3, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r10, r9
    ADD r3, r10
    MOV r12, r24
    LDI r5, 24
    SHR r12, r5             ; top byte
    STORE r3, r12

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r10, r9
    ADD r3, r10
    LDI r12, 0xFFE
    LOAD r12, r12
    STORE r3, r12

    ; Advance head
    ADD r6, r9
    LDI r10, 32
    CMP r6, r10
    BLT r7, no_wrap
    LDI r6, 0
no_wrap:
    ADD r4, r9
    ADD r14, r9

no_pkt:
    ; == RATE UPDATE ==
    LDI r10, 0xFFE
    LOAD r11, r10
    LDI r10, 63
    AND r11, r10
    LDI r10, 2
    CMP r11, r10
    BGE r7, no_rate
    MOV r1, r14
    LDI r14, 0
no_rate:

    ; == TITLE BAR ==
    LDI r10, 0
    LDI r3, 0
    LDI r12, 256
    LDI r5, 14
    LDI r13, 0x003366
    RECTF r10, r3, r12, r5, r13

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r10, 0xE003
    LDI r3, 0
    LDI r12, 0
    IOCTL r10, r3, r12
    LDI r10, 0
    CMP r7, r10
    JZ r7, net_down_label

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
    LDI r10, 0
    CMP r4, r10
    JZ r7, show_empty

    ; Determine entry index
    LDI r10, 28
    CMP r4, r10
    BGE r7, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r4
    BLT r7, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r10, r6
    LDI r3, 28
    SUB r10, r3
    ADD r10, r25
    LDI r3, 31
    AND r10, r3

do_draw_entry:
    ; r10 = entry index
    LDI r3, 2
    SHL r10, r3             ; entry * 4
    MOV r12, r22
    ADD r12, r10             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r3, r12
    ADD r3, r9
    LOAD r13, r3           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r5, 0xE0
    AND r13, r5            ; top 3 bits
    LDI r5, 5
    SHR r13, r5            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r5, 0x44
    OR r13, r5             ; ensure minimum brightness

    ; Draw row bar
    LDI r10, 2
    LDI r3, 256
    LDI r5, 7
    RECTF r10, r17, r3, r5, r13

    ; Draw a bright accent line on left
    MOV r10, r12
    LOAD r0, r10           ; data word
    LDI r11, 16
    SHR r0, r11
    LDI r11, 0xF
    AND r0, r11
    LDI r11, 2
    MUL r0, r11
    ADD r0, r9             ; width = 3..33
    LDI r11, 0x00CCFF      ; cyan accent
    RECTF r10, r17, r0, r5, r11

skip_row:
    LDI r10, 8
    ADD r17, r10
    ADD r25, r9
    LDI r10, 28
    CMP r25, r10
    BLT r7, pkt_row
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
    LDI r10, 0
    LDI r3, 242
    LDI r12, 256
    LDI r5, 14
    LDI r13, 0x002244
    RECTF r10, r3, r12, r5, r13

    ; Build "PKT:N" at 0x6000
    LDI r10, 0x6000
    LDI r13, 80            ; 'P'
    STORE r10, r13
    ADD r10, r9
    LDI r13, 75
    STORE r10, r13
    ADD r10, r9
    LDI r13, 84
    STORE r10, r13
    ADD r10, r9
    LDI r13, 58
    STORE r10, r13
    ADD r10, r9
    LDI r13, 32
    STORE r10, r13
    ADD r10, r9

    ; Decimal convert r4
    MOV r3, r4
    LDI r12, 0x6020
    LDI r13, 0
    STORE r12, r13
    ; Special case: if r4 == 0, write '0'
    LDI r13, 0
    CMP r3, r13
    JNZ r7, dec_nonzero
    LDI r13, 48
    SUB r12, r9
    STORE r12, r13
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r3
    DIV r28, r27
    MUL r28, r27
    MOV r29, r3
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r12, r9
    STORE r12, r29
    LDI r28, 10
    DIV r3, r28
    LDI r28, 0
    CMP r3, r28
    JNZ r7, dec_nonzero
dec_copy:
    LDI r10, 0x6005
dec_cp:
    LOAD r3, r12
    LDI r27, 0
    CMP r3, r27
    JZ r7, dec_cp_done
    STORE r10, r3
    ADD r10, r9
    ADD r12, r9
    JMP dec_cp
dec_cp_done:
    LDI r13, 0
    STORE r10, r13

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r10, 0x6030
    LDI r13, 82
    STORE r10, r13
    ADD r10, r9
    LDI r13, 65
    STORE r10, r13
    ADD r10, r9
    LDI r13, 84
    STORE r10, r13
    ADD r10, r9
    LDI r13, 69
    STORE r10, r13
    ADD r10, r9
    LDI r13, 58
    STORE r10, r13
    ADD r10, r9
    LDI r13, 32
    STORE r10, r13
    ADD r10, r9

    ; Decimal convert r1
    MOV r3, r1
    LDI r12, 0x6050
    LDI r13, 0
    STORE r12, r13
    LDI r13, 0
    CMP r3, r13
    JNZ r7, rdec_nonzero
    LDI r13, 48
    SUB r12, r9
    STORE r12, r13
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r3
    DIV r28, r27
    MUL r28, r27
    MOV r29, r3
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r12, r9
    STORE r12, r29
    LDI r28, 10
    DIV r3, r28
    LDI r28, 0
    CMP r3, r28
    JNZ r7, rdec_nonzero
rdec_copy:
    LDI r10, 0x6037
rdec_cp:
    LOAD r3, r12
    LDI r27, 0
    CMP r3, r27
    JZ r7, rdec_done
    STORE r10, r3
    ADD r10, r9
    ADD r12, r9
    JMP rdec_cp
rdec_done:
    LDI r13, 47
    STORE r10, r13
    ADD r10, r9
    LDI r13, 115
    STORE r10, r13
    ADD r10, r9
    LDI r13, 0
    STORE r10, r13

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
