; DESCRIPTION: Places a magenta line segment connecting (151, 226) to (318, 24).
; PLAN: r0=151(x1), r1=226(y1), r2=318(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 226
LDI r2, 318
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
