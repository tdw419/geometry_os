; DESCRIPTION: Draws a blue line from (28, 185) to (183, 162).
; PLAN: r0=28(x1), r1=185(y1), r2=183(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 185
LDI r2, 183
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
