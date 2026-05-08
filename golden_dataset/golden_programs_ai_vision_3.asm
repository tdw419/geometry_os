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
LDI r15, 0xFF0000   ; red
LDI r7, 0          ; y = 0
LDI r13, 256        ; screen width
LDI r11, 32         ; bar spacing

draw_loop:
  LDI r5, 0        ; x = 0
  draw_row:
    PSET r5, r7, r15
    ADD r5, r1     ; x++
    CMP r5, r13
    BLT r14, draw_row
  ADD r7, r1       ; y++
  CMP r7, r11
  BLT r14, draw_loop

; ── Get checksum before (op=1) ──
LDI r10, 1
AI_AGENT r10       ; r14 = checksum
MOV r4, r14        ; save in r4

; ── Modify screen -- blue square ──
LDI r15, 0x0000FF   ; blue
LDI r7, 100
LDI r11, 156

fill_y:
  LDI r5, 100
  fill_x:
    PSET r5, r7, r15
    ADD r5, r1
    CMP r5, r11
    BLT r14, fill_x
  ADD r7, r1
  CMP r7, r11
  BLT r14, fill_y

; ── Get checksum after (op=1) ──
LDI r10, 1
AI_AGENT r10       ; r14 = new checksum
MOV r3, r14        ; save in r3

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r0, 0x5000
LDI r10, 0x64      ; 'd'
STORE r0, r10
LDI r2, 0x65      ; 'e'
MOV r10, r0
ADD r10, r1
STORE r10, r2
LDI r2, 0x73      ; 's'
MOV r10, r0
ADD r10, r1
ADD r10, r1
STORE r10, r2
LDI r2, 0x63      ; 'c'
MOV r10, r0
ADD r10, r1
ADD r10, r1
ADD r10, r1
STORE r10, r2
MOV r10, r0
ADD r10, r1
ADD r10, r1
ADD r10, r1
ADD r10, r1
LDI r2, 0
STORE r10, r2

; Set up registers for vision API
LDI r10, 3         ; op=3 (vision API)
MOV r8, r0       ; prompt addr
LDI r4, 0x6000    ; response addr
LDI r3, 256       ; max response length
AI_AGENT r10       ; r14 = response length

HALT
