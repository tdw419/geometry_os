; DESCRIPTION: Places a yellow line segment connecting (63, 124) to (78, 122).
; PLAN: r0=63(x1), r1=124(y1), r2=78(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 124
LDI r2, 78
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
