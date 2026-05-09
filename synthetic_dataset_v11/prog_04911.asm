; DESCRIPTION: Draws a orange line from (241, 73) to (158, 164).
; PLAN: r0=241(x1), r1=73(y1), r2=158(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 73
LDI r2, 158
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
