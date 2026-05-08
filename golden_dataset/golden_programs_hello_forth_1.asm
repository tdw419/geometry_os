; DESCRIPTION: Render a red square at the screen.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r9, 32
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 72
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 101
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 108
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 108
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 111
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 32
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 102
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 114
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 111
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 109
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 32
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 70
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 111
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 114
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 116
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 104
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 33
  LDI r1, 0xFFB
  STORE r1, r9    ; emit char
  LDI r9, 10
  LDI r1, 0xFFB
  STORE r1, r9    ; newline
RET
word_1:
; : SQUARE 
  LDI r9, 1
  LOAD r9, [r30]       ; DUP: peek TOS
  PUSH r9
  LOAD r3, [r30]       ; TOS
  LDI r9, 1
  ADD r30, r9          ; SP++
  LOAD r4, [r30]       ; NOS
  MUL r3, r4           ; TOS * NOS
  STORE [r30], r3
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r9, 1
  LOAD r9, [r30]       ; DUP: peek TOS
  PUSH r9
  LOAD r9, [r30]       ; pop number
  LDI r4, 1
  ADD r30, r4
  LDI r1, 0xFFB
  STORE r1, r9    ; write to debug port
  LDI r9, 10
  LDI r1, 0xFFB
  STORE r1, r9    ; newline
  LDI r9, 1
  LOAD r4, [r30]
  SUB r4, r9
  STORE [r30], r4
  LDI r9, 1
  LOAD r9, [r30]       ; DUP: peek TOS
  PUSH r9
  LOAD r9, [r30]
  CMPI r9, 0
  JZ r15, zerogt_4_false
  LDI r9, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r9, 0
  zerogt_4_done:
  STORE [r30], r9
  LOAD r9, [r30]       ; pop condition
  LDI r4, 1
  ADD r30, r4
  CMPI r9, 0
  JZ r15, begin_3
  LDI r15, 1
  ADD r30, r15          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r9, 32
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 53
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 32
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 115
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 113
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 117
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 97
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 114
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 101
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 100
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 32
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 61
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 32
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 5
PUSH r9
CALL word_1
; (call SQUARE)
LOAD r9, [r30]       ; pop number
LDI r4, 1
ADD r30, r4
LDI r1, 0xFFB
STORE r1, r9    ; write to debug port
LDI r9, 10
LDI r1, 0xFFB
STORE r1, r9    ; newline
; dotquote:  Countdown from 5:
LDI r9, 32
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 67
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 111
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 117
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 110
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 116
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 100
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 111
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 119
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 110
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 32
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 102
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 114
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 111
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 109
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 32
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 53
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 58
LDI r1, 0xFFB
STORE r1, r9    ; emit char
LDI r9, 10
LDI r1, 0xFFB
STORE r1, r9    ; newline
LDI r9, 5
PUSH r9
CALL word_2
; (call COUNTDOWN)
HALT