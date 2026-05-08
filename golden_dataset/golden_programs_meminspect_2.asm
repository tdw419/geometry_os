; DESCRIPTION: Geometry OS program to draw a red object.

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
LDI r5, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r5
LDI r21, 49
STORE r20, r21
ADD r20, r5
LDI r21, 50
STORE r20, r21
ADD r20, r5
LDI r21, 51
STORE r20, r21
ADD r20, r5
LDI r21, 52
STORE r20, r21
ADD r20, r5
LDI r21, 53
STORE r20, r21
ADD r20, r5
LDI r21, 54
STORE r20, r21
ADD r20, r5
LDI r21, 55
STORE r20, r21
ADD r20, r5
LDI r21, 56
STORE r20, r21
ADD r20, r5
LDI r21, 57
STORE r20, r21
ADD r20, r5
LDI r21, 65
STORE r20, r21
ADD r20, r5
LDI r21, 66
STORE r20, r21
ADD r20, r5
LDI r21, 67
STORE r20, r21
ADD r20, r5
LDI r21, 68
STORE r20, r21
ADD r20, r5
LDI r21, 69
STORE r20, r21
ADD r20, r5
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r1, 0x2000
STORE r20, r1
LDI r20, ROW_SCROLL
LDI r1, 0
STORE r20, r1

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r5
LDI r21, 101
STORE r20, r21
ADD r20, r5
LDI r21, 108
STORE r20, r21
ADD r20, r5
LDI r21, 108
STORE r20, r21
ADD r20, r5
LDI r21, 111
STORE r20, r21
ADD r20, r5
LDI r21, 44
STORE r20, r21
ADD r20, r5
LDI r21, 32
STORE r20, r21
ADD r20, r5
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r8

  LDI r13, 38
  CMP r8, r13
  JZ r12, do_up

  LDI r13, 40
  CMP r8, r13
  JZ r12, do_down

  ; Number keys 0-9
  LDI r13, 48
  CMP r8, r13
  BLT r12, do_draw

  LDI r13, 58
  CMP r8, r13
  BGE r12, do_draw

  LDI r13, 48
  SUB r8, r13
  LDI r13, 256
  MUL r8, r13
  LDI r20, VIEW_ADDR
  STORE r20, r8
  LDI r20, ROW_SCROLL
  LDI r1, 0
  STORE r20, r1
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r1, r20
  LDI r13, 0
  CMP r1, r13
  JZ r12, do_draw
  SUB r1, r5
  STORE r20, r1
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r1, r20
  ADD r1, r5
  LDI r13, 32
  CMP r1, r13
  BGE r12, do_draw
  STORE r20, r1
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r10, 0x080818
  FILL r10

  ; Title bar
  LDI r10, 0
  LDI r6, 0
  LDI r14, 256
  LDI r4, 16
  LDI r3, 0x004488
  RECTF r10, r6, r14, r4, r3

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r10, 30
  LDI r6, 3
  LDI r14, BUF
  LDI r4, 0xFFFFFF
  LDI r3, 0x004488
  DRAWTEXT r10, r6, r14, r4, r3

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r2, r20
  LDI r20, ROW_SCROLL
  LOAD r15, r20
  LDI r13, 8
  MUL r15, r13
  ADD r2, r15          ; r2 = start addr for display

  ; Draw 14 hex dump rows
  LDI r9, 0            ; row counter
  LDI r11, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r2 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r15, r2
  MOV r16, r22
  SHR r15, r16
  LDI r16, 0xF
  AND r15, r16
  LDI r16, HEX_TABLE
  ADD r16, r15
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r5
  SUB r22, r5
  LDI r16, 0
  CMP r22, r16
  BLT r12, addr_done
  ; But we need 4 digits only (bits 15:0), so iterate 4 times with shifts 12,8,4,0
  ; Actually we want 8 hex digits for full u32
  ; Let's just do the full 8-digit address
  LDI r16, 0
  CMP r22, r16
  JNZ r12, nxt_addr_nib
addr_done:
  ; Hmm, this loop structure is wrong. Let me do it simpler.
  ; Just write 4 hex digits for the low 16 bits

  ; Actually, let me inline it simply:
  ; Build "XXXX:" where XXXX is the address in hex
  LDI r21, BUF

  ; Nibble 3 (bits 15:12)
  MOV r15, r2
  LDI r16, 12
  SHR r15, r16
  LDI r16, 0xF
  AND r15, r16
  LDI r16, HEX_TABLE
  ADD r16, r15
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r5

  ; Nibble 2 (bits 11:8)
  MOV r15, r2
  LDI r16, 8
  SHR r15, r16
  LDI r16, 0xF
  AND r15, r16
  LDI r16, HEX_TABLE
  ADD r16, r15
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r5

  ; Nibble 1 (bits 7:4)
  MOV r15, r2
  LDI r16, 4
  SHR r15, r16
  LDI r16, 0xF
  AND r15, r16
  LDI r16, HEX_TABLE
  ADD r16, r15
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r5

  ; Nibble 0 (bits 3:0)
  MOV r15, r2
  LDI r16, 0xF
  AND r15, r16
  LDI r16, HEX_TABLE
  ADD r16, r15
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r5

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r5
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r5

  ; Read 8 bytes, write hex
  MOV r26, r2
  LDI r25, 0
nxt_byte:
  LOAD r1, r26

  ; High nibble
  LDI r10, 4
  SHR r1, r10
  LDI r10, 0xF
  AND r1, r10
  LDI r10, HEX_TABLE
  ADD r10, r1
  LOAD r10, r10
  STORE r21, r10
  ADD r21, r5

  ; Low nibble
  LOAD r1, r26
  LDI r10, 0xF
  AND r1, r10
  LDI r10, HEX_TABLE
  ADD r10, r1
  LOAD r10, r10
  STORE r21, r10
  ADD r21, r5

  ; Space
  LDI r10, 32
  STORE r21, r10
  ADD r21, r5

  ADD r26, r5
  ADD r25, r5
  LDI r10, 8
  CMP r25, r10
  BLT r12, nxt_byte

  ; " |" separator
  LDI r10, 32
  STORE r21, r10
  ADD r21, r5
  LDI r10, 124          ; '|'
  STORE r21, r10
  ADD r21, r5

  ; ASCII
  MOV r26, r2
  LDI r25, 0
nxt_ascii:
  LOAD r1, r26
  LDI r10, 32
  CMP r1, r10
  BLT r12, put_dot
  LDI r10, 127
  CMP r1, r10
  BGE r12, put_dot
  STORE r21, r1
  JMP nxt_asc2
put_dot:
  LDI r10, 46
  STORE r21, r10
nxt_asc2:
  ADD r21, r5
  ADD r26, r5
  ADD r25, r5
  LDI r10, 8
  CMP r25, r10
  BLT r12, nxt_ascii

  ; Trailing | and null
  LDI r10, 124
  STORE r21, r10
  ADD r21, r5
  LDI r10, 0
  STORE r21, r10

  ; Draw
  LDI r10, 2
  MOV r6, r11
  LDI r14, BUF
  LDI r4, 0xCCCCCC
  LDI r3, 0x080818
  DRAWTEXT r10, r6, r14, r4, r3

  ; Advance by 8
  LDI r13, 8
  ADD r2, r13
  LDI r13, 15
  ADD r11, r13
  ADD r9, r5
  LDI r13, 14
  CMP r9, r13
  BLT r12, nxt_row

  ; Status bar
  LDI r10, 0
  LDI r6, 236
  LDI r14, 256
  LDI r4, 20
  LDI r3, 0x1A1A2E
  RECTF r10, r6, r14, r4, r3

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r10, 4
  LDI r6, 238
  LDI r14, BUF
  LDI r4, 0x888888
  LDI r3, 0x1A1A2E
  DRAWTEXT r10, r6, r14, r4, r3

  FRAME
  JMP main_loop
