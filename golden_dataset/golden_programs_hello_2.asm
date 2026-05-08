; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r5, 32
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 72
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 101
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 108
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 108
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 111
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 32
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 102
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 114
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 111
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 109
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 32
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 70
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 111
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 114
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 116
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 104
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 33
  LDI r1, 0xFFB
  STORE r1, r5    ; emit char
  LDI r5, 10
  LDI r1, 0xFFB
  STORE r1, r5    ; newline
RET
word_1:
; : SQUARE 
  LDI r5, 1
  LOAD r5, [r30]       ; DUP: peek TOS
  PUSH r5
  LOAD r3, [r30]       ; TOS
  LDI r5, 1
  ADD r30, r5          ; SP++
  LOAD r15, [r30]       ; NOS
  MUL r3, r15           ; TOS * NOS
  STORE [r30], r3
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r5, 1
  LOAD r5, [r30]       ; DUP: peek TOS
  PUSH r5
  LOAD r5, [r30]       ; pop number
  LDI r15, 1
  ADD r30, r15
  LDI r1, 0xFFB
  STORE r1, r5    ; write to debug port
  LDI r5, 10
  LDI r1, 0xFFB
  STORE r1, r5    ; newline
  LDI r5, 1
  LOAD r15, [r30]
  SUB r15, r5
  STORE [r30], r15
  LDI r5, 1
  LOAD r5, [r30]       ; DUP: peek TOS
  PUSH r5
  LOAD r5, [r30]
  CMPI r5, 0
  JZ r12, zerogt_4_false
  LDI r5, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r5, 0
  zerogt_4_done:
  STORE [r30], r5
  LOAD r5, [r30]       ; pop condition
  LDI r15, 1
  ADD r30, r15
  CMPI r5, 0
  JZ r12, begin_3
  LDI r12, 1
  ADD r30, r12          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r5, 32
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 53
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 32
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 115
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 113
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 117
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 97
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 114
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 101
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 100
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 32
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 61
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 32
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 5
PUSH r5
CALL word_1
; (call SQUARE)
LOAD r5, [r30]       ; pop number
LDI r15, 1
ADD r30, r15
LDI r1, 0xFFB
STORE r1, r5    ; write to debug port
LDI r5, 10
LDI r1, 0xFFB
STORE r1, r5    ; newline
; dotquote:  Countdown from 5:
LDI r5, 32
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 67
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 111
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 117
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 110
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 116
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 100
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 111
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 119
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 110
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 32
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 102
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 114
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 111
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 109
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 32
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 53
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 58
LDI r1, 0xFFB
STORE r1, r5    ; emit char
LDI r5, 10
LDI r1, 0xFFB
STORE r1, r5    ; newline
LDI r5, 5
PUSH r5
CALL word_2
; (call COUNTDOWN)
HALT