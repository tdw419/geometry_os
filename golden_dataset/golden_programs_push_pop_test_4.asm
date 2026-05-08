; DESCRIPTION: This GeOS assembly code tests stack operations using register r30 as the stack pointer, verifying LIFO order, stack pointer tracking, handling of multiple values, and preservation of register contents across push/pop cycles. Test results are stored in RAM addresses from 0x0200 to 0x0208.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r6, 100
  LDI r8, 200
  LDI r14, 300
  PUSH r6           ; push 100
  PUSH r8           ; push 200
  PUSH r14           ; push 300
  POP r2            ; r2 = 300 (top)
  POP r11            ; r11 = 200
  POP r13            ; r13 = 100
  LDI r10, 0x0200
  STORE r10, r2     ; RAM[0x0200] = 300
  LDI r10, 0x0201
  STORE r10, r11     ; RAM[0x0201] = 200
  LDI r10, 0x0202
  STORE r10, r13     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r6, 0
  PUSH r6           ; push 0
  LDI r6, 1
  PUSH r6           ; push 1
  LDI r6, 2
  PUSH r6           ; push 2
  POP r2            ; r2 = 2
  POP r11            ; r11 = 1
  POP r13            ; r13 = 0
  LDI r10, 0x0203
  STORE r10, r2     ; RAM[0x0203] = 2
  LDI r10, 0x0204
  STORE r10, r11     ; RAM[0x0204] = 1
  LDI r10, 0x0205
  STORE r10, r13     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r6, 42
  PUSH r6           ; push at SP = 0xFF00
  POP r2            ; r2 should be 42 if SP is correct
  LDI r10, 0x0206
  STORE r10, r2     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r6, 777
  PUSH r6           ; save 777
  LDI r6, 0         ; clobber r6
  ADD r6, r8        ; r6 = 0 + r8 (some garbage value)
  LDI r6, 0
  ADD r6, r14
  POP r2            ; r2 should still be 777
  LDI r10, 0x0207
  STORE r10, r2     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r6, 10
  PUSH r6
  LDI r6, 20
  PUSH r6
  LDI r6, 30
  PUSH r6
  LDI r6, 40
  PUSH r6
  LDI r6, 50
  PUSH r6
  ; Pop into r2 and accumulate sum
  LDI r2, 0
  POP r11
  ADD r2, r11        ; 50
  POP r11
  ADD r2, r11        ; 50+40=90
  POP r11
  ADD r2, r11        ; 90+30=120
  POP r11
  ADD r2, r11        ; 120+20=140
  POP r11
  ADD r2, r11        ; 140+10=150
  LDI r10, 0x0208
  STORE r10, r2     ; RAM[0x0208] = 150

  HALT
