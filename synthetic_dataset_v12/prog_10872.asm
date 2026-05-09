; DESCRIPTION: Places a green line segment connecting (63, 76) to (205, 155).
; PLAN: r0=63(x1), r1=76(y1), r2=205(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 76
LDI r2, 205
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
