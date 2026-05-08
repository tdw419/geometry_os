; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r11, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r10, 0             ; op=0 (inject key)
  LDI r3, 65            ; keycode = 65 ('A')
  LDI r12, 0             ; shift = 0
  AI_INJECT r10           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r5               ; r5 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r13, 0xFF00       ; green
  LDI r0, 0xFF0000     ; red
  LDI r2, 65           ; expected value
  CMP r5, r2
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
  RECTF r20, r21, r22, r23, r13

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r10, 1             ; op=1 (inject mouse move)
  LDI r3, 128           ; x = 128
  LDI r12, 128           ; y = 128
  AI_INJECT r10           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r10, 2             ; op=2 (inject mouse click)
  LDI r3, 100           ; x = 100
  LDI r12, 200           ; y = 200
  LDI r5, 2             ; button = 2 (click)
  AI_INJECT r10           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r13, 0x2000
  LDI r0, 72           ; 'H'
  STORE r13, r0
  MOV r2, r13
  ADD r2, r11           ; r2 = 0x2001
  LDI r0, 73           ; 'I'
  STORE r2, r0
  MOV r2, r13
  ADD r2, r11
  ADD r2, r11           ; r2 = 0x2002
  LDI r0, 0
  STORE r2, r0        ; null terminator

  ; Inject the text string
  LDI r10, 3             ; op=3 (inject text string)
  LDI r3, 0x2000        ; addr of null-terminated string
  AI_INJECT r10           ; inject "HI" -- r7 = count (2)

  ; Draw colored bar for each injected char
  LDI r6, 0x0000FF     ; blue
  LDI r13, 10           ; start x
  LDI r0, 10           ; y position
  LDI r2, 10           ; width
  LDI r8, 10           ; height
  LDI r14, 0            ; counter

draw_loop:
  CMP r14, r7            ; compare counter with injected count
  BGE r7, done
  RECTF r13, r0, r2, r8, r6
  LDI r16, 12
  ADD r13, r16           ; move x right
  ADD r14, r11            ; counter++
  JMP draw_loop

done:
  HALT
