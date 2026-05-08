; DESCRIPTION: Draws a red square at the screen with fixed size.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r2, 32
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 72
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 101
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 108
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 108
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 111
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 32
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 102
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 114
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 111
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 109
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 32
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 70
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 111
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 114
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 116
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 104
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 33
  LDI r6, 0xFFB
  STORE r6, r2    ; emit char
  LDI r2, 10
  LDI r6, 0xFFB
  STORE r6, r2    ; newline
RET
word_1:
; : SQUARE 
  LDI r2, 1
  LOAD r2, [r30]       ; DUP: peek TOS
  PUSH r2
  LOAD r11, [r30]       ; TOS
  LDI r2, 1
  ADD r30, r2          ; SP++
  LOAD r4, [r30]       ; NOS
  MUL r11, r4           ; TOS * NOS
  STORE [r30], r11
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r2, 1
  LOAD r2, [r30]       ; DUP: peek TOS
  PUSH r2
  LOAD r2, [r30]       ; pop number
  LDI r4, 1
  ADD r30, r4
  LDI r6, 0xFFB
  STORE r6, r2    ; write to debug port
  LDI r2, 10
  LDI r6, 0xFFB
  STORE r6, r2    ; newline
  LDI r2, 1
  LOAD r4, [r30]
  SUB r4, r2
  STORE [r30], r4
  LDI r2, 1
  LOAD r2, [r30]       ; DUP: peek TOS
  PUSH r2
  LOAD r2, [r30]
  CMPI r2, 0
  JZ r8, zerogt_4_false
  LDI r2, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r2, 0
  zerogt_4_done:
  STORE [r30], r2
  LOAD r2, [r30]       ; pop condition
  LDI r4, 1
  ADD r30, r4
  CMPI r2, 0
  JZ r8, begin_3
  LDI r8, 1
  ADD r30, r8          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r2, 32
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 53
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 32
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 115
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 113
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 117
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 97
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 114
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 101
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 100
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 32
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 61
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 32
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 5
PUSH r2
CALL word_1
; (call SQUARE)
LOAD r2, [r30]       ; pop number
LDI r4, 1
ADD r30, r4
LDI r6, 0xFFB
STORE r6, r2    ; write to debug port
LDI r2, 10
LDI r6, 0xFFB
STORE r6, r2    ; newline
; dotquote:  Countdown from 5:
LDI r2, 32
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 67
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 111
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 117
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 110
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 116
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 100
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 111
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 119
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 110
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 32
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 102
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 114
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 111
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 109
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 32
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 53
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 58
LDI r6, 0xFFB
STORE r6, r2    ; emit char
LDI r2, 10
LDI r6, 0xFFB
STORE r6, r2    ; newline
LDI r2, 5
PUSH r2
CALL word_2
; (call COUNTDOWN)
HALT