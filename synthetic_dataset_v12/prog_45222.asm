; DESCRIPTION: Places a magenta line segment connecting (105, 175) to (28, 186).
; PLAN: r0=105(x1), r1=175(y1), r2=28(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 175
LDI r2, 28
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
