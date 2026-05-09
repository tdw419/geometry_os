; DESCRIPTION: Places a orange line segment connecting (27, 165) to (433, 147).
; PLAN: r0=27(x1), r1=165(y1), r2=433(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 165
LDI r2, 433
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
