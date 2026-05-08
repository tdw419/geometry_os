; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r0, 100
  LDI r5, 200
  LDI r9, 300
  PUSH r0           ; push 100
  PUSH r5           ; push 200
  PUSH r9           ; push 300
  POP r11            ; r11 = 300 (top)
  POP r13            ; r13 = 200
  POP r12            ; r12 = 100
  LDI r2, 0x0200
  STORE r2, r11     ; RAM[0x0200] = 300
  LDI r2, 0x0201
  STORE r2, r13     ; RAM[0x0201] = 200
  LDI r2, 0x0202
  STORE r2, r12     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r0, 0
  PUSH r0           ; push 0
  LDI r0, 1
  PUSH r0           ; push 1
  LDI r0, 2
  PUSH r0           ; push 2
  POP r11            ; r11 = 2
  POP r13            ; r13 = 1
  POP r12            ; r12 = 0
  LDI r2, 0x0203
  STORE r2, r11     ; RAM[0x0203] = 2
  LDI r2, 0x0204
  STORE r2, r13     ; RAM[0x0204] = 1
  LDI r2, 0x0205
  STORE r2, r12     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r0, 42
  PUSH r0           ; push at SP = 0xFF00
  POP r11            ; r11 should be 42 if SP is correct
  LDI r2, 0x0206
  STORE r2, r11     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r0, 777
  PUSH r0           ; save 777
  LDI r0, 0         ; clobber r0
  ADD r0, r5        ; r0 = 0 + r5 (some garbage value)
  LDI r0, 0
  ADD r0, r9
  POP r11            ; r11 should still be 777
  LDI r2, 0x0207
  STORE r2, r11     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r0, 10
  PUSH r0
  LDI r0, 20
  PUSH r0
  LDI r0, 30
  PUSH r0
  LDI r0, 40
  PUSH r0
  LDI r0, 50
  PUSH r0
  ; Pop into r11 and accumulate sum
  LDI r11, 0
  POP r13
  ADD r11, r13        ; 50
  POP r13
  ADD r11, r13        ; 50+40=90
  POP r13
  ADD r11, r13        ; 90+30=120
  POP r13
  ADD r11, r13        ; 120+20=140
  POP r13
  ADD r11, r13        ; 140+10=150
  LDI r2, 0x0208
  STORE r2, r11     ; RAM[0x0208] = 150

  HALT
