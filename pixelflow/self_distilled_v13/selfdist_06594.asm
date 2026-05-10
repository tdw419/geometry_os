; DESCRIPTION: Renders a red line segment connecting (116, 43) to (261, 1).
; PLAN: r0=116(x1), r1=43(y1), r2=261(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 43
LDI r2, 261
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
