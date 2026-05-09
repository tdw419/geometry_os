; DESCRIPTION: Renders a red line between points (11, 130) and (179, 78).
; PLAN: r0=11(x1), r1=130(y1), r2=179(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 130
LDI r2, 179
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
