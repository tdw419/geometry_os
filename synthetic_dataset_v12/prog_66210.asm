; DESCRIPTION: Places a orange line segment connecting (492, 144) to (282, 91).
; PLAN: r0=492(x1), r1=144(y1), r2=282(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 144
LDI r2, 282
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
