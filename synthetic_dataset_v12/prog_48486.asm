; DESCRIPTION: Draws a orange line from (456, 66) to (75, 22).
; PLAN: r0=456(x1), r1=66(y1), r2=75(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 66
LDI r2, 75
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
