; DESCRIPTION: Draws a orange line from (1, 90) to (104, 6).
; PLAN: r0=1(x1), r1=90(y1), r2=104(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 90
LDI r2, 104
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
