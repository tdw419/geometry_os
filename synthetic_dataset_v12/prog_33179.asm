; DESCRIPTION: Places a orange line segment connecting (464, 154) to (334, 160).
; PLAN: r0=464(x1), r1=154(y1), r2=334(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 154
LDI r2, 334
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
