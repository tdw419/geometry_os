; DESCRIPTION: Draws a orange line from (265, 29) to (292, 114).
; PLAN: r0=265(x1), r1=29(y1), r2=292(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 29
LDI r2, 292
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
