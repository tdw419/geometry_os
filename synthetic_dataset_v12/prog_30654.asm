; DESCRIPTION: Places a orange line segment connecting (285, 144) to (328, 71).
; PLAN: r0=285(x1), r1=144(y1), r2=328(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 144
LDI r2, 328
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
