; DESCRIPTION: Places a magenta line segment connecting (68, 125) to (110, 248).
; PLAN: r0=68(x1), r1=125(y1), r2=110(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 125
LDI r2, 110
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
