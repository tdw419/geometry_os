; DESCRIPTION: Places a magenta line segment connecting (226, 3) to (118, 248).
; PLAN: r0=226(x1), r1=3(y1), r2=118(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 3
LDI r2, 118
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
