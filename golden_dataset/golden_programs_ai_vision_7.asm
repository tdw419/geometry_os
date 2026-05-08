; DESCRIPTION: Render a red square at the screen.

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
LDI r14, 1
LDI r3, 0xFF0000   ; red
LDI r11, 0          ; y = 0
LDI r1, 256        ; screen width
LDI r9, 32         ; bar spacing

draw_loop:
  LDI r12, 0        ; x = 0
  draw_row:
    PSET r12, r11, r3
    ADD r12, r14     ; x++
    CMP r12, r1
    BLT r15, draw_row
  ADD r11, r14       ; y++
  CMP r11, r9
  BLT r15, draw_loop

; ── Get checksum before (op=1) ──
LDI r10, 1
AI_AGENT r10       ; r15 = checksum
MOV r4, r15        ; save in r4

; ── Modify screen -- blue square ──
LDI r3, 0x0000FF   ; blue
LDI r11, 100
LDI r9, 156

fill_y:
  LDI r12, 100
  fill_x:
    PSET r12, r11, r3
    ADD r12, r14
    CMP r12, r9
    BLT r15, fill_x
  ADD r11, r14
  CMP r11, r9
  BLT r15, fill_y

; ── Get checksum after (op=1) ──
LDI r10, 1
AI_AGENT r10       ; r15 = new checksum
MOV r0, r15        ; save in r0

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r5, 0x5000
LDI r10, 0x64      ; 'd'
STORE r5, r10
LDI r7, 0x65      ; 'e'
MOV r10, r5
ADD r10, r14
STORE r10, r7
LDI r7, 0x73      ; 's'
MOV r10, r5
ADD r10, r14
ADD r10, r14
STORE r10, r7
LDI r7, 0x63      ; 'c'
MOV r10, r5
ADD r10, r14
ADD r10, r14
ADD r10, r14
STORE r10, r7
MOV r10, r5
ADD r10, r14
ADD r10, r14
ADD r10, r14
ADD r10, r14
LDI r7, 0
STORE r10, r7

; Set up registers for vision API
LDI r10, 3         ; op=3 (vision API)
MOV r2, r5       ; prompt addr
LDI r4, 0x6000    ; response addr
LDI r0, 256       ; max response length
AI_AGENT r10       ; r15 = response length

HALT
