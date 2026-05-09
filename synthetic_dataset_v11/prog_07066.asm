; DESCRIPTION: Renders a orange line between points (167, 236) and (226, 38).
; PLAN: r0=167(x1), r1=236(y1), r2=226(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 236
LDI r2, 226
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
