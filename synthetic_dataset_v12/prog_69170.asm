; DESCRIPTION: Renders a orange line between points (282, 183) and (28, 177).
; PLAN: r0=282(x1), r1=183(y1), r2=28(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 183
LDI r2, 28
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
