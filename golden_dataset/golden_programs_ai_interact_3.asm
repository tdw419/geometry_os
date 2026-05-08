; DESCRIPTION: This GeOS assembly code demonstrates programmatic input injection via the AI_INJECT opcode. It injects keystrokes and mouse inputs into the system, reads them back, and visually confirms the operations by drawing colored borders on the screen.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r5, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r10, 0             ; op=0 (inject key)
  LDI r2, 65            ; keycode = 65 ('A')
  LDI r13, 0             ; shift = 0
  AI_INJECT r10           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r12               ; r12 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r11, 0xFF00       ; green
  LDI r0, 0xFF0000     ; red
  LDI r15, 65           ; expected value
  CMP r12, r15
  JZ r7, key_ok

  ; Wrong key -- draw red border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r0
  JMP do_mouse

key_ok:
  ; Correct key -- draw green border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r11

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r10, 1             ; op=1 (inject mouse move)
  LDI r2, 128           ; x = 128
  LDI r13, 128           ; y = 128
  AI_INJECT r10           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r10, 2             ; op=2 (inject mouse click)
  LDI r2, 100           ; x = 100
  LDI r13, 200           ; y = 200
  LDI r12, 2             ; button = 2 (click)
  AI_INJECT r10           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r11, 0x2000
  LDI r0, 72           ; 'H'
  STORE r11, r0
  MOV r15, r11
  ADD r15, r5           ; r15 = 0x2001
  LDI r0, 73           ; 'I'
  STORE r15, r0
  MOV r15, r11
  ADD r15, r5
  ADD r15, r5           ; r15 = 0x2002
  LDI r0, 0
  STORE r15, r0        ; null terminator

  ; Inject the text string
  LDI r10, 3             ; op=3 (inject text string)
  LDI r2, 0x2000        ; addr of null-terminated string
  AI_INJECT r10           ; inject "HI" -- r7 = count (2)

  ; Draw colored bar for each injected char
  LDI r9, 0x0000FF     ; blue
  LDI r11, 10           ; start x
  LDI r0, 10           ; y position
  LDI r15, 10           ; width
  LDI r8, 10           ; height
  LDI r6, 0            ; counter

draw_loop:
  CMP r6, r7            ; compare counter with injected count
  BGE r7, done
  RECTF r11, r0, r15, r8, r9
  LDI r16, 12
  ADD r11, r16           ; move x right
  ADD r6, r5            ; counter++
  JMP draw_loop

done:
  HALT
