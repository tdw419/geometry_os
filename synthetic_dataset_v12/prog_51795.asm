; DESCRIPTION: Renders a orange line between points (167, 105) and (307, 7).
; PLAN: r0=167(x1), r1=105(y1), r2=307(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 105
LDI r2, 307
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
