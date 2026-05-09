; DESCRIPTION: Draws a magenta line from (379, 53) to (117, 203).
; PLAN: r0=379(x1), r1=53(y1), r2=117(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 53
LDI r2, 117
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
