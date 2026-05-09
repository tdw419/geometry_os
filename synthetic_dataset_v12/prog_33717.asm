; DESCRIPTION: Renders a orange line between points (341, 246) and (328, 36).
; PLAN: r0=341(x1), r1=246(y1), r2=328(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 246
LDI r2, 328
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
