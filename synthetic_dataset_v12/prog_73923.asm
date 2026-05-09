; DESCRIPTION: Places a magenta line segment connecting (96, 87) to (375, 24).
; PLAN: r0=96(x1), r1=87(y1), r2=375(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 87
LDI r2, 375
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
