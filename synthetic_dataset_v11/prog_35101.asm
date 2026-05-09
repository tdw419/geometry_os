; DESCRIPTION: Renders a orange line between points (4, 73) and (167, 83).
; PLAN: r0=4(x1), r1=73(y1), r2=167(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 73
LDI r2, 167
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
