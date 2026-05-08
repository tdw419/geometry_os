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
    LDI r5, 1
    LDI r3, 0
    LDI r2, 0             ; total packets
    LDI r4, 0            ; rate counter
    LDI r13, 0            ; displayed rate
    LDI r12, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r10, net_path
    LDI r6, 0
    OPEN r10, r6
    MOV r15, r11            ; r15 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r10, 0x080810
    FILL r10

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r10, 0xFFE
    LOAD r10, r10
    LDI r6, 31
    AND r10, r6
    LDI r6, 15
    CMP r10, r6
    JNZ r11, no_sim
    RAND r10
    LDI r6, 0xFFC
    STORE r6, r10
no_sim:

    ; == READ FROM /dev/net ==
    LDI r10, 0xFFC
    LDI r6, 1
    READ r15, r10, r6
    LDI r10, 0
    CMP r11, r10
    JZ r11, no_pkt

    ; Store packet
    LDI r10, 0xFFC
    LOAD r24, r10           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r10, r12
    LDI r6, 2
    SHL r10, r6
    MOV r6, r22
    ADD r6, r10
    STORE r6, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r10, r5
    ADD r6, r10
    MOV r7, r24
    LDI r1, 24
    SHR r7, r1             ; top byte
    STORE r6, r7

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r10, r5
    ADD r6, r10
    LDI r7, 0xFFE
    LOAD r7, r7
    STORE r6, r7

    ; Advance head
    ADD r12, r5
    LDI r10, 32
    CMP r12, r10
    BLT r11, no_wrap
    LDI r12, 0
no_wrap:
    ADD r2, r5
    ADD r4, r5

no_pkt:
    ; == RATE UPDATE ==
    LDI r10, 0xFFE
    LOAD r8, r10
    LDI r10, 63
    AND r8, r10
    LDI r10, 2
    CMP r8, r10
    BGE r11, no_rate
    MOV r13, r4
    LDI r4, 0
no_rate:

    ; == TITLE BAR ==
    LDI r10, 0
    LDI r6, 0
    LDI r7, 256
    LDI r1, 14
    LDI r0, 0x003366
    RECTF r10, r6, r7, r1, r0

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r10, 0xE003
    LDI r6, 0
    LDI r7, 0
    IOCTL r10, r6, r7
    LDI r10, 0
    CMP r11, r10
    JZ r11, net_down_label

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
    CMP r2, r10
    JZ r11, show_empty

    ; Determine entry index
    LDI r10, 28
    CMP r2, r10
    BGE r11, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r2
    BLT r11, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r10, r12
    LDI r6, 28
    SUB r10, r6
    ADD r10, r25
    LDI r6, 31
    AND r10, r6

do_draw_entry:
    ; r10 = entry index
    LDI r6, 2
    SHL r10, r6             ; entry * 4
    MOV r7, r22
    ADD r7, r10             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r6, r7
    ADD r6, r5
    LOAD r0, r6           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r1, 0xE0
    AND r0, r1            ; top 3 bits
    LDI r1, 5
    SHR r0, r1            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r1, 0x44
    OR r0, r1             ; ensure minimum brightness

    ; Draw row bar
    LDI r10, 2
    LDI r6, 256
    LDI r1, 7
    RECTF r10, r17, r6, r1, r0

    ; Draw a bright accent line on left
    MOV r10, r7
    LOAD r14, r10           ; data word
    LDI r8, 16
    SHR r14, r8
    LDI r8, 0xF
    AND r14, r8
    LDI r8, 2
    MUL r14, r8
    ADD r14, r5             ; width = 3..33
    LDI r8, 0x00CCFF      ; cyan accent
    RECTF r10, r17, r14, r1, r8

skip_row:
    LDI r10, 8
    ADD r17, r10
    ADD r25, r5
    LDI r10, 28
    CMP r25, r10
    BLT r11, pkt_row
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
    LDI r6, 242
    LDI r7, 256
    LDI r1, 14
    LDI r0, 0x002244
    RECTF r10, r6, r7, r1, r0

    ; Build "PKT:N" at 0x6000
    LDI r10, 0x6000
    LDI r0, 80            ; 'P'
    STORE r10, r0
    ADD r10, r5
    LDI r0, 75
    STORE r10, r0
    ADD r10, r5
    LDI r0, 84
    STORE r10, r0
    ADD r10, r5
    LDI r0, 58
    STORE r10, r0
    ADD r10, r5
    LDI r0, 32
    STORE r10, r0
    ADD r10, r5

    ; Decimal convert r2
    MOV r6, r2
    LDI r7, 0x6020
    LDI r0, 0
    STORE r7, r0
    ; Special case: if r2 == 0, write '0'
    LDI r0, 0
    CMP r6, r0
    JNZ r11, dec_nonzero
    LDI r0, 48
    SUB r7, r5
    STORE r7, r0
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r6
    DIV r28, r27
    MUL r28, r27
    MOV r29, r6
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r7, r5
    STORE r7, r29
    LDI r28, 10
    DIV r6, r28
    LDI r28, 0
    CMP r6, r28
    JNZ r11, dec_nonzero
dec_copy:
    LDI r10, 0x6005
dec_cp:
    LOAD r6, r7
    LDI r27, 0
    CMP r6, r27
    JZ r11, dec_cp_done
    STORE r10, r6
    ADD r10, r5
    ADD r7, r5
    JMP dec_cp
dec_cp_done:
    LDI r0, 0
    STORE r10, r0

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r10, 0x6030
    LDI r0, 82
    STORE r10, r0
    ADD r10, r5
    LDI r0, 65
    STORE r10, r0
    ADD r10, r5
    LDI r0, 84
    STORE r10, r0
    ADD r10, r5
    LDI r0, 69
    STORE r10, r0
    ADD r10, r5
    LDI r0, 58
    STORE r10, r0
    ADD r10, r5
    LDI r0, 32
    STORE r10, r0
    ADD r10, r5

    ; Decimal convert r13
    MOV r6, r13
    LDI r7, 0x6050
    LDI r0, 0
    STORE r7, r0
    LDI r0, 0
    CMP r6, r0
    JNZ r11, rdec_nonzero
    LDI r0, 48
    SUB r7, r5
    STORE r7, r0
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r6
    DIV r28, r27
    MUL r28, r27
    MOV r29, r6
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r7, r5
    STORE r7, r29
    LDI r28, 10
    DIV r6, r28
    LDI r28, 0
    CMP r6, r28
    JNZ r11, rdec_nonzero
rdec_copy:
    LDI r10, 0x6037
rdec_cp:
    LOAD r6, r7
    LDI r27, 0
    CMP r6, r27
    JZ r11, rdec_done
    STORE r10, r6
    ADD r10, r5
    ADD r7, r5
    JMP rdec_cp
rdec_done:
    LDI r0, 47
    STORE r10, r0
    ADD r10, r5
    LDI r0, 115
    STORE r10, r0
    ADD r10, r5
    LDI r0, 0
    STORE r10, r0

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
