; DESCRIPTION: Renders a white line between points (118, 246) and (172, 154).
; PLAN: r0=118(x1), r1=246(y1), r2=172(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 246
LDI r2, 172
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
