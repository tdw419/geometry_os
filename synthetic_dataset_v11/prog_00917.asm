; DESCRIPTION: Renders a orange line between points (246, 210) and (185, 2).
; PLAN: r0=246(x1), r1=210(y1), r2=185(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 210
LDI r2, 185
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
