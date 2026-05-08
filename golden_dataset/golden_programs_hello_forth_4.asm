; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r15, 32
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 72
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 101
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 108
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 108
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 111
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 32
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 102
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 114
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 111
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 109
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 32
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 70
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 111
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 114
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 116
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 104
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 33
  LDI r7, 0xFFB
  STORE r7, r15    ; emit char
  LDI r15, 10
  LDI r7, 0xFFB
  STORE r7, r15    ; newline
RET
word_1:
; : SQUARE 
  LDI r15, 1
  LOAD r15, [r30]       ; DUP: peek TOS
  PUSH r15
  LOAD r1, [r30]       ; TOS
  LDI r15, 1
  ADD r30, r15          ; SP++
  LOAD r4, [r30]       ; NOS
  MUL r1, r4           ; TOS * NOS
  STORE [r30], r1
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r15, 1
  LOAD r15, [r30]       ; DUP: peek TOS
  PUSH r15
  LOAD r15, [r30]       ; pop number
  LDI r4, 1
  ADD r30, r4
  LDI r7, 0xFFB
  STORE r7, r15    ; write to debug port
  LDI r15, 10
  LDI r7, 0xFFB
  STORE r7, r15    ; newline
  LDI r15, 1
  LOAD r4, [r30]
  SUB r4, r15
  STORE [r30], r4
  LDI r15, 1
  LOAD r15, [r30]       ; DUP: peek TOS
  PUSH r15
  LOAD r15, [r30]
  CMPI r15, 0
  JZ r9, zerogt_4_false
  LDI r15, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r15, 0
  zerogt_4_done:
  STORE [r30], r15
  LOAD r15, [r30]       ; pop condition
  LDI r4, 1
  ADD r30, r4
  CMPI r15, 0
  JZ r9, begin_3
  LDI r9, 1
  ADD r30, r9          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r15, 32
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 53
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 32
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 115
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 113
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 117
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 97
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 114
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 101
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 100
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 32
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 61
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 32
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 5
PUSH r15
CALL word_1
; (call SQUARE)
LOAD r15, [r30]       ; pop number
LDI r4, 1
ADD r30, r4
LDI r7, 0xFFB
STORE r7, r15    ; write to debug port
LDI r15, 10
LDI r7, 0xFFB
STORE r7, r15    ; newline
; dotquote:  Countdown from 5:
LDI r15, 32
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 67
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 111
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 117
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 110
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 116
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 100
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 111
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 119
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 110
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 32
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 102
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 114
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 111
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 109
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 32
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 53
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 58
LDI r7, 0xFFB
STORE r7, r15    ; emit char
LDI r15, 10
LDI r7, 0xFFB
STORE r7, r15    ; newline
LDI r15, 5
PUSH r15
CALL word_2
; (call COUNTDOWN)
HALT