; DESCRIPTION: Places a orange line segment connecting (83, 68) to (328, 255).
; PLAN: r0=83(x1), r1=68(y1), r2=328(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 68
LDI r2, 328
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
