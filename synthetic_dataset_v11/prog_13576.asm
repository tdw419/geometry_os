; DESCRIPTION: Places a orange line segment connecting (36, 50) to (237, 94).
; PLAN: r0=36(x1), r1=50(y1), r2=237(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 50
LDI r2, 237
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
