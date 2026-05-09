; DESCRIPTION: Places a yellow line segment connecting (338, 172) to (94, 211).
; PLAN: r0=338(x1), r1=172(y1), r2=94(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 172
LDI r2, 94
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
