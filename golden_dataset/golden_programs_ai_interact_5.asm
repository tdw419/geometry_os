; DESCRIPTION: This GeOS assembly code demonstrates programmatic input injection via the AI_INJECT opcode. It injects keystrokes and mouse inputs into the system, reads them back, and visually confirms the operations by drawing colored borders on the screen.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r7, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r6, 0             ; op=0 (inject key)
  LDI r5, 65            ; keycode = 65 ('A')
  LDI r2, 0             ; shift = 0
  AI_INJECT r6           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r0               ; r0 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r11, 0xFF00       ; green
  LDI r14, 0xFF0000     ; red
  LDI r10, 65           ; expected value
  CMP r0, r10
  JZ r8, key_ok

  ; Wrong key -- draw red border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r14
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
  LDI r6, 1             ; op=1 (inject mouse move)
  LDI r5, 128           ; x = 128
  LDI r2, 128           ; y = 128
  AI_INJECT r6           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r6, 2             ; op=2 (inject mouse click)
  LDI r5, 100           ; x = 100
  LDI r2, 200           ; y = 200
  LDI r0, 2             ; button = 2 (click)
  AI_INJECT r6           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r11, 0x2000
  LDI r14, 72           ; 'H'
  STORE r11, r14
  MOV r10, r11
  ADD r10, r7           ; r10 = 0x2001
  LDI r14, 73           ; 'I'
  STORE r10, r14
  MOV r10, r11
  ADD r10, r7
  ADD r10, r7           ; r10 = 0x2002
  LDI r14, 0
  STORE r10, r14        ; null terminator

  ; Inject the text string
  LDI r6, 3             ; op=3 (inject text string)
  LDI r5, 0x2000        ; addr of null-terminated string
  AI_INJECT r6           ; inject "HI" -- r8 = count (2)

  ; Draw colored bar for each injected char
  LDI r12, 0x0000FF     ; blue
  LDI r11, 10           ; start x
  LDI r14, 10           ; y position
  LDI r10, 10           ; width
  LDI r13, 10           ; height
  LDI r15, 0            ; counter

draw_loop:
  CMP r15, r8            ; compare counter with injected count
  BGE r8, done
  RECTF r11, r14, r10, r13, r12
  LDI r16, 12
  ADD r11, r16           ; move x right
  ADD r15, r7            ; counter++
  JMP draw_loop

done:
  HALT
