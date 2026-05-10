; DESCRIPTION: Renders a red line segment connecting (268, 106) to (116, 172).
; PLAN: r0=268(x1), r1=106(y1), r2=116(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 106
LDI r2, 116
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
