; DESCRIPTION: Draws a orange line from (30, 54) to (292, 233).
; PLAN: r0=30(x1), r1=54(y1), r2=292(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 54
LDI r2, 292
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
