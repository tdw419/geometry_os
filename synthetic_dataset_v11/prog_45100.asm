; DESCRIPTION: Draws a orange line from (190, 210) to (15, 75).
; PLAN: r0=190(x1), r1=210(y1), r2=15(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 210
LDI r2, 15
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
