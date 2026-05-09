; DESCRIPTION: Draws a orange line from (119, 16) to (1, 104).
; PLAN: r0=119(x1), r1=16(y1), r2=1(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 16
LDI r2, 1
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
