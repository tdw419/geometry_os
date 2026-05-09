; DESCRIPTION: Draws a orange line from (15, 76) to (0, 164).
; PLAN: r0=15(x1), r1=76(y1), r2=0(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 76
LDI r2, 0
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
