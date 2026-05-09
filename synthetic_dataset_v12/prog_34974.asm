; DESCRIPTION: Places a orange line segment connecting (418, 240) to (237, 159).
; PLAN: r0=418(x1), r1=240(y1), r2=237(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 240
LDI r2, 237
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
