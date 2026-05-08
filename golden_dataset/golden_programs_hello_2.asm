; DESCRIPTION: Draws a red square at the screen with fixed size.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r3, 32
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 72
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 101
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 108
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 108
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 111
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 32
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 102
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 114
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 111
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 109
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 32
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 70
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 111
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 114
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 116
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 104
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 33
  LDI r0, 0xFFB
  STORE r0, r3    ; emit char
  LDI r3, 10
  LDI r0, 0xFFB
  STORE r0, r3    ; newline
RET
word_1:
; : SQUARE 
  LDI r3, 1
  LOAD r3, [r30]       ; DUP: peek TOS
  PUSH r3
  LOAD r10, [r30]       ; TOS
  LDI r3, 1
  ADD r30, r3          ; SP++
  LOAD r8, [r30]       ; NOS
  MUL r10, r8           ; TOS * NOS
  STORE [r30], r10
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r3, 1
  LOAD r3, [r30]       ; DUP: peek TOS
  PUSH r3
  LOAD r3, [r30]       ; pop number
  LDI r8, 1
  ADD r30, r8
  LDI r0, 0xFFB
  STORE r0, r3    ; write to debug port
  LDI r3, 10
  LDI r0, 0xFFB
  STORE r0, r3    ; newline
  LDI r3, 1
  LOAD r8, [r30]
  SUB r8, r3
  STORE [r30], r8
  LDI r3, 1
  LOAD r3, [r30]       ; DUP: peek TOS
  PUSH r3
  LOAD r3, [r30]
  CMPI r3, 0
  JZ r7, zerogt_4_false
  LDI r3, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r3, 0
  zerogt_4_done:
  STORE [r30], r3
  LOAD r3, [r30]       ; pop condition
  LDI r8, 1
  ADD r30, r8
  CMPI r3, 0
  JZ r7, begin_3
  LDI r7, 1
  ADD r30, r7          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r3, 32
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 53
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 32
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 115
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 113
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 117
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 97
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 114
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 101
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 100
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 32
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 61
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 32
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 5
PUSH r3
CALL word_1
; (call SQUARE)
LOAD r3, [r30]       ; pop number
LDI r8, 1
ADD r30, r8
LDI r0, 0xFFB
STORE r0, r3    ; write to debug port
LDI r3, 10
LDI r0, 0xFFB
STORE r0, r3    ; newline
; dotquote:  Countdown from 5:
LDI r3, 32
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 67
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 111
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 117
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 110
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 116
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 100
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 111
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 119
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 110
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 32
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 102
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 114
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 111
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 109
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 32
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 53
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 58
LDI r0, 0xFFB
STORE r0, r3    ; emit char
LDI r3, 10
LDI r0, 0xFFB
STORE r0, r3    ; newline
LDI r3, 5
PUSH r3
CALL word_2
; (call COUNTDOWN)
HALT