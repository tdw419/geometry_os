; DESCRIPTION: Places a magenta line segment connecting (78, 217) to (239, 24).
; PLAN: r0=78(x1), r1=217(y1), r2=239(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 217
LDI r2, 239
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
