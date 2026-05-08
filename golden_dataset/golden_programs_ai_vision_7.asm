; DESCRIPTION: The assembly code demonstrates the AI Vision Bridge functionality by drawing red bars on the screen, taking a checksum of the initial state, modifying the screen with a blue square, taking another checksum after modification, and making a mock call to the vision API with the prompt "desc". The program uses specific opcodes and registers to handle these tasks.

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
LDI r10, 1
LDI r12, 0xFF0000   ; red
LDI r1, 0          ; y = 0
LDI r5, 256        ; screen width
LDI r2, 32         ; bar spacing

draw_loop:
  LDI r4, 0        ; x = 0
  draw_row:
    PSET r4, r1, r12
    ADD r4, r10     ; x++
    CMP r4, r5
    BLT r15, draw_row
  ADD r1, r10       ; y++
  CMP r1, r2
  BLT r15, draw_loop

; ── Get checksum before (op=1) ──
LDI r3, 1
AI_AGENT r3       ; r15 = checksum
MOV r6, r15        ; save in r6

; ── Modify screen -- blue square ──
LDI r12, 0x0000FF   ; blue
LDI r1, 100
LDI r2, 156

fill_y:
  LDI r4, 100
  fill_x:
    PSET r4, r1, r12
    ADD r4, r10
    CMP r4, r2
    BLT r15, fill_x
  ADD r1, r10
  CMP r1, r2
  BLT r15, fill_y

; ── Get checksum after (op=1) ──
LDI r3, 1
AI_AGENT r3       ; r15 = new checksum
MOV r0, r15        ; save in r0

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r11, 0x5000
LDI r3, 0x64      ; 'd'
STORE r11, r3
LDI r13, 0x65      ; 'e'
MOV r3, r11
ADD r3, r10
STORE r3, r13
LDI r13, 0x73      ; 's'
MOV r3, r11
ADD r3, r10
ADD r3, r10
STORE r3, r13
LDI r13, 0x63      ; 'c'
MOV r3, r11
ADD r3, r10
ADD r3, r10
ADD r3, r10
STORE r3, r13
MOV r3, r11
ADD r3, r10
ADD r3, r10
ADD r3, r10
ADD r3, r10
LDI r13, 0
STORE r3, r13

; Set up registers for vision API
LDI r3, 3         ; op=3 (vision API)
MOV r8, r11       ; prompt addr
LDI r6, 0x6000    ; response addr
LDI r0, 256       ; max response length
AI_AGENT r3       ; r15 = response length

HALT
