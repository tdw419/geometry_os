; DESCRIPTION: Places a orange line segment connecting (220, 253) to (176, 11).
; PLAN: r0=220(x1), r1=253(y1), r2=176(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 253
LDI r2, 176
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
