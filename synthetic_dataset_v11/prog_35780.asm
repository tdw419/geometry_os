; DESCRIPTION: Places a orange line segment connecting (141, 154) to (230, 176).
; PLAN: r0=141(x1), r1=154(y1), r2=230(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 154
LDI r2, 230
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
