; DESCRIPTION: Draws a orange line from (251, 240) to (6, 72).
; PLAN: r0=251(x1), r1=240(y1), r2=6(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 240
LDI r2, 6
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
