; DESCRIPTION: Places a magenta line segment connecting (240, 78) to (377, 212).
; PLAN: r0=240(x1), r1=78(y1), r2=377(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 78
LDI r2, 377
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
