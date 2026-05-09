; DESCRIPTION: Places a orange line segment connecting (143, 144) to (424, 12).
; PLAN: r0=143(x1), r1=144(y1), r2=424(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 144
LDI r2, 424
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
