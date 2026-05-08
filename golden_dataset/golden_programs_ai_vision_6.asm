; DESCRIPTION: Display a square using color red at the screen.

; ai_vision.asm -- Phase 88: AI Vision Bridge demo
;
; Demonstrates the AI_AGENT opcode:
;   op=0: screenshot to VFS file
;   op=1: canvas checksum
;   op=3: vision API call (with mock response)
;
; The program draws red bars, takes a checksum,
; modifies the screen, takes another checksum, and calls the vision API.

; ── Draw red bars ──
LDI r1, 1
LDI r7, 0xFF0000   ; red
LDI r8, 0          ; y = 0
LDI r15, 256        ; screen width
LDI r2, 32         ; bar spacing

draw_loop:
  LDI r11, 0        ; x = 0
  draw_row:
    PSET r11, r8, r7
    ADD r11, r1     ; x++
    CMP r11, r15
    BLT r12, draw_row
  ADD r8, r1       ; y++
  CMP r8, r2
  BLT r12, draw_loop

; ── Get checksum before (op=1) ──
LDI r3, 1
AI_AGENT r3       ; r12 = checksum
MOV r9, r12        ; save in r9

; ── Modify screen -- blue square ──
LDI r7, 0x0000FF   ; blue
LDI r8, 100
LDI r2, 156

fill_y:
  LDI r11, 100
  fill_x:
    PSET r11, r8, r7
    ADD r11, r1
    CMP r11, r2
    BLT r12, fill_x
  ADD r8, r1
  CMP r8, r2
  BLT r12, fill_y

; ── Get checksum after (op=1) ──
LDI r3, 1
AI_AGENT r3       ; r12 = new checksum
MOV r13, r12        ; save in r13

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r4, 0x5000
LDI r3, 0x64      ; 'd'
STORE r4, r3
LDI r10, 0x65      ; 'e'
MOV r3, r4
ADD r3, r1
STORE r3, r10
LDI r10, 0x73      ; 's'
MOV r3, r4
ADD r3, r1
ADD r3, r1
STORE r3, r10
LDI r10, 0x63      ; 'c'
MOV r3, r4
ADD r3, r1
ADD r3, r1
ADD r3, r1
STORE r3, r10
MOV r3, r4
ADD r3, r1
ADD r3, r1
ADD r3, r1
ADD r3, r1
LDI r10, 0
STORE r3, r10

; Set up registers for vision API
LDI r3, 3         ; op=3 (vision API)
MOV r0, r4       ; prompt addr
LDI r9, 0x6000    ; response addr
LDI r13, 256       ; max response length
AI_AGENT r3       ; r12 = response length

HALT
