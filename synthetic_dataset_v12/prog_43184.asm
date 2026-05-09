; DESCRIPTION: Renders a orange line between points (167, 28) and (432, 246).
; PLAN: r0=167(x1), r1=28(y1), r2=432(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 28
LDI r2, 432
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
