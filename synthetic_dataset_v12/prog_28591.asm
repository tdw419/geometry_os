; DESCRIPTION: Places a orange line segment connecting (268, 62) to (237, 197).
; PLAN: r0=268(x1), r1=62(y1), r2=237(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 62
LDI r2, 237
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
