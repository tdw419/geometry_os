; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r4, 32
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 72
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 101
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 108
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 108
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 111
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 32
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 102
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 114
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 111
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 109
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 32
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 70
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 111
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 114
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 116
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 104
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 33
  LDI r0, 0xFFB
  STORE r0, r4    ; emit char
  LDI r4, 10
  LDI r0, 0xFFB
  STORE r0, r4    ; newline
RET
word_1:
; : SQUARE 
  LDI r4, 1
  LOAD r4, [r30]       ; DUP: peek TOS
  PUSH r4
  LOAD r9, [r30]       ; TOS
  LDI r4, 1
  ADD r30, r4          ; SP++
  LOAD r7, [r30]       ; NOS
  MUL r9, r7           ; TOS * NOS
  STORE [r30], r9
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r4, 1
  LOAD r4, [r30]       ; DUP: peek TOS
  PUSH r4
  LOAD r4, [r30]       ; pop number
  LDI r7, 1
  ADD r30, r7
  LDI r0, 0xFFB
  STORE r0, r4    ; write to debug port
  LDI r4, 10
  LDI r0, 0xFFB
  STORE r0, r4    ; newline
  LDI r4, 1
  LOAD r7, [r30]
  SUB r7, r4
  STORE [r30], r7
  LDI r4, 1
  LOAD r4, [r30]       ; DUP: peek TOS
  PUSH r4
  LOAD r4, [r30]
  CMPI r4, 0
  JZ r8, zerogt_4_false
  LDI r4, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r4, 0
  zerogt_4_done:
  STORE [r30], r4
  LOAD r4, [r30]       ; pop condition
  LDI r7, 1
  ADD r30, r7
  CMPI r4, 0
  JZ r8, begin_3
  LDI r8, 1
  ADD r30, r8          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r4, 32
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 53
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 32
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 115
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 113
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 117
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 97
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 114
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 101
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 100
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 32
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 61
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 32
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 5
PUSH r4
CALL word_1
; (call SQUARE)
LOAD r4, [r30]       ; pop number
LDI r7, 1
ADD r30, r7
LDI r0, 0xFFB
STORE r0, r4    ; write to debug port
LDI r4, 10
LDI r0, 0xFFB
STORE r0, r4    ; newline
; dotquote:  Countdown from 5:
LDI r4, 32
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 67
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 111
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 117
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 110
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 116
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 100
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 111
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 119
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 110
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 32
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 102
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 114
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 111
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 109
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 32
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 53
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 58
LDI r0, 0xFFB
STORE r0, r4    ; emit char
LDI r4, 10
LDI r0, 0xFFB
STORE r0, r4    ; newline
LDI r4, 5
PUSH r4
CALL word_2
; (call COUNTDOWN)
HALT