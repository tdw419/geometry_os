; DESCRIPTION: Renders a red line between points (179, 15) and (67, 2).
; PLAN: r0=179(x1), r1=15(y1), r2=67(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 15
LDI r2, 67
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
