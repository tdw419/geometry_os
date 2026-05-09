; DESCRIPTION: Places a magenta line segment connecting (13, 17) to (7, 226).
; PLAN: r0=13(x1), r1=17(y1), r2=7(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 17
LDI r2, 7
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
