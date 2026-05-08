; DESCRIPTION: This GeOS assembly code tests stack operations using register r30 as the stack pointer, verifying LIFO order, stack pointer tracking, handling of multiple values, and preservation of register contents across push/pop cycles. Test results are stored in RAM addresses from 0x0200 to 0x0208.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r0, 100
  LDI r7, 200
  LDI r5, 300
  PUSH r0           ; push 100
  PUSH r7           ; push 200
  PUSH r5           ; push 300
  POP r11            ; r11 = 300 (top)
  POP r15            ; r15 = 200
  POP r3            ; r3 = 100
  LDI r1, 0x0200
  STORE r1, r11     ; RAM[0x0200] = 300
  LDI r1, 0x0201
  STORE r1, r15     ; RAM[0x0201] = 200
  LDI r1, 0x0202
  STORE r1, r3     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r0, 0
  PUSH r0           ; push 0
  LDI r0, 1
  PUSH r0           ; push 1
  LDI r0, 2
  PUSH r0           ; push 2
  POP r11            ; r11 = 2
  POP r15            ; r15 = 1
  POP r3            ; r3 = 0
  LDI r1, 0x0203
  STORE r1, r11     ; RAM[0x0203] = 2
  LDI r1, 0x0204
  STORE r1, r15     ; RAM[0x0204] = 1
  LDI r1, 0x0205
  STORE r1, r3     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r0, 42
  PUSH r0           ; push at SP = 0xFF00
  POP r11            ; r11 should be 42 if SP is correct
  LDI r1, 0x0206
  STORE r1, r11     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r0, 777
  PUSH r0           ; save 777
  LDI r0, 0         ; clobber r0
  ADD r0, r7        ; r0 = 0 + r7 (some garbage value)
  LDI r0, 0
  ADD r0, r5
  POP r11            ; r11 should still be 777
  LDI r1, 0x0207
  STORE r1, r11     ; RAM[0x0207] = 777

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
  POP r15
  ADD r11, r15        ; 50
  POP r15
  ADD r11, r15        ; 50+40=90
  POP r15
  ADD r11, r15        ; 90+30=120
  POP r15
  ADD r11, r15        ; 120+20=140
  POP r15
  ADD r11, r15        ; 140+10=150
  LDI r1, 0x0208
  STORE r1, r11     ; RAM[0x0208] = 150

  HALT
