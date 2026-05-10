; DESCRIPTION: Places a orange line segment connecting (288, 166) to (448, 83).
; PLAN: r0=288(x1), r1=166(y1), r2=448(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 166
LDI r2, 448
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
