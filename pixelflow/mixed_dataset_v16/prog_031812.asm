; DESCRIPTION: Draws a orange line from (139, 55) to (247, 71).
; PLAN: r0=139(x1), r1=55(y1), r2=247(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 55
LDI r2, 247
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
