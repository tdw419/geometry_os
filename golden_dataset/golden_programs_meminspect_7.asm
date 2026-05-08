; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; meminspect.asm -- Memory Inspector for Geometry OS
;
; Phase 76: Memory Inspector
;
; Hex dump of RAM regions with ASCII alongside hex.
; Arrow keys to scroll, number keys 0-9 jump to addr*256.
;
; RAM Layout:
;   0x6000-0x60FF   String buffers
;   0x6200-0x62FF   Hex scratch
;   0x6400-0x640F   Hex digit lookup
;   0x6500          Current view address
;   0x6501          Scroll offset (rows)
;
; Screen: 14 rows of 8 bytes with hex + ASCII

#define KEY_PORT  0xFFF
#define BUF       0x6000
#define HEX_BUF   0x6200
#define HEX_TABLE 0x6400
#define VIEW_ADDR 0x6500
#define ROW_SCROLL 0x6501

LDI r30, 0xFD00
LDI r10, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r10
LDI r21, 49
STORE r20, r21
ADD r20, r10
LDI r21, 50
STORE r20, r21
ADD r20, r10
LDI r21, 51
STORE r20, r21
ADD r20, r10
LDI r21, 52
STORE r20, r21
ADD r20, r10
LDI r21, 53
STORE r20, r21
ADD r20, r10
LDI r21, 54
STORE r20, r21
ADD r20, r10
LDI r21, 55
STORE r20, r21
ADD r20, r10
LDI r21, 56
STORE r20, r21
ADD r20, r10
LDI r21, 57
STORE r20, r21
ADD r20, r10
LDI r21, 65
STORE r20, r21
ADD r20, r10
LDI r21, 66
STORE r20, r21
ADD r20, r10
LDI r21, 67
STORE r20, r21
ADD r20, r10
LDI r21, 68
STORE r20, r21
ADD r20, r10
LDI r21, 69
STORE r20, r21
ADD r20, r10
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r13, 0x2000
STORE r20, r13
LDI r20, ROW_SCROLL
LDI r13, 0
STORE r20, r13

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r10
LDI r21, 101
STORE r20, r21
ADD r20, r10
LDI r21, 108
STORE r20, r21
ADD r20, r10
LDI r21, 108
STORE r20, r21
ADD r20, r10
LDI r21, 111
STORE r20, r21
ADD r20, r10
LDI r21, 44
STORE r20, r21
ADD r20, r10
LDI r21, 32
STORE r20, r21
ADD r20, r10
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r7

  LDI r2, 38
  CMP r7, r2
  JZ r4, do_up

  LDI r2, 40
  CMP r7, r2
  JZ r4, do_down

  ; Number keys 0-9
  LDI r2, 48
  CMP r7, r2
  BLT r4, do_draw

  LDI r2, 58
  CMP r7, r2
  BGE r4, do_draw

  LDI r2, 48
  SUB r7, r2
  LDI r2, 256
  MUL r7, r2
  LDI r20, VIEW_ADDR
  STORE r20, r7
  LDI r20, ROW_SCROLL
  LDI r13, 0
  STORE r20, r13
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r13, r20
  LDI r2, 0
  CMP r13, r2
  JZ r4, do_draw
  SUB r13, r10
  STORE r20, r13
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r13, r20
  ADD r13, r10
  LDI r2, 32
  CMP r13, r2
  BGE r4, do_draw
  STORE r20, r13
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r5, 0x080818
  FILL r5

  ; Title bar
  LDI r5, 0
  LDI r12, 0
  LDI r11, 256
  LDI r14, 16
  LDI r0, 0x004488
  RECTF r5, r12, r11, r14, r0

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r5, 30
  LDI r12, 3
  LDI r11, BUF
  LDI r14, 0xFFFFFF
  LDI r0, 0x004488
  DRAWTEXT r5, r12, r11, r14, r0

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r1, r20
  LDI r20, ROW_SCROLL
  LOAD r6, r20
  LDI r2, 8
  MUL r6, r2
  ADD r1, r6          ; r1 = start addr for display

  ; Draw 14 hex dump rows
  LDI r15, 0            ; row counter
  LDI r3, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r1 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r6, r1
  MOV r16, r22
  SHR r6, r16
  LDI r16, 0xF
  AND r6, r16
  LDI r16, HEX_TABLE
  ADD r16, r6
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r10
  SUB r22, r10
  LDI r16, 0
  CMP r22, r16
  BLT r4, addr_done
  ; But we need 4 digits only (bits 15:0), so iterate 4 times with shifts 12,8,4,0
  ; Actually we want 8 hex digits for full u32
  ; Let's just do the full 8-digit address
  LDI r16, 0
  CMP r22, r16
  JNZ r4, nxt_addr_nib
addr_done:
  ; Hmm, this loop structure is wrong. Let me do it simpler.
  ; Just write 4 hex digits for the low 16 bits

  ; Actually, let me inline it simply:
  ; Build "XXXX:" where XXXX is the address in hex
  LDI r21, BUF

  ; Nibble 3 (bits 15:12)
  MOV r6, r1
  LDI r16, 12
  SHR r6, r16
  LDI r16, 0xF
  AND r6, r16
  LDI r16, HEX_TABLE
  ADD r16, r6
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r10

  ; Nibble 2 (bits 11:8)
  MOV r6, r1
  LDI r16, 8
  SHR r6, r16
  LDI r16, 0xF
  AND r6, r16
  LDI r16, HEX_TABLE
  ADD r16, r6
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r10

  ; Nibble 1 (bits 7:4)
  MOV r6, r1
  LDI r16, 4
  SHR r6, r16
  LDI r16, 0xF
  AND r6, r16
  LDI r16, HEX_TABLE
  ADD r16, r6
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r10

  ; Nibble 0 (bits 3:0)
  MOV r6, r1
  LDI r16, 0xF
  AND r6, r16
  LDI r16, HEX_TABLE
  ADD r16, r6
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r10

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r10
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r10

  ; Read 8 bytes, write hex
  MOV r26, r1
  LDI r25, 0
nxt_byte:
  LOAD r13, r26

  ; High nibble
  LDI r5, 4
  SHR r13, r5
  LDI r5, 0xF
  AND r13, r5
  LDI r5, HEX_TABLE
  ADD r5, r13
  LOAD r5, r5
  STORE r21, r5
  ADD r21, r10

  ; Low nibble
  LOAD r13, r26
  LDI r5, 0xF
  AND r13, r5
  LDI r5, HEX_TABLE
  ADD r5, r13
  LOAD r5, r5
  STORE r21, r5
  ADD r21, r10

  ; Space
  LDI r5, 32
  STORE r21, r5
  ADD r21, r10

  ADD r26, r10
  ADD r25, r10
  LDI r5, 8
  CMP r25, r5
  BLT r4, nxt_byte

  ; " |" separator
  LDI r5, 32
  STORE r21, r5
  ADD r21, r10
  LDI r5, 124          ; '|'
  STORE r21, r5
  ADD r21, r10

  ; ASCII
  MOV r26, r1
  LDI r25, 0
nxt_ascii:
  LOAD r13, r26
  LDI r5, 32
  CMP r13, r5
  BLT r4, put_dot
  LDI r5, 127
  CMP r13, r5
  BGE r4, put_dot
  STORE r21, r13
  JMP nxt_asc2
put_dot:
  LDI r5, 46
  STORE r21, r5
nxt_asc2:
  ADD r21, r10
  ADD r26, r10
  ADD r25, r10
  LDI r5, 8
  CMP r25, r5
  BLT r4, nxt_ascii

  ; Trailing | and null
  LDI r5, 124
  STORE r21, r5
  ADD r21, r10
  LDI r5, 0
  STORE r21, r5

  ; Draw
  LDI r5, 2
  MOV r12, r3
  LDI r11, BUF
  LDI r14, 0xCCCCCC
  LDI r0, 0x080818
  DRAWTEXT r5, r12, r11, r14, r0

  ; Advance by 8
  LDI r2, 8
  ADD r1, r2
  LDI r2, 15
  ADD r3, r2
  ADD r15, r10
  LDI r2, 14
  CMP r15, r2
  BLT r4, nxt_row

  ; Status bar
  LDI r5, 0
  LDI r12, 236
  LDI r11, 256
  LDI r14, 20
  LDI r0, 0x1A1A2E
  RECTF r5, r12, r11, r14, r0

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r5, 4
  LDI r12, 238
  LDI r11, BUF
  LDI r14, 0x888888
  LDI r0, 0x1A1A2E
  DRAWTEXT r5, r12, r11, r14, r0

  FRAME
  JMP main_loop
