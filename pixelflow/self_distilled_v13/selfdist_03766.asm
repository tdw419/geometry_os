; DESCRIPTION: Renders a red line segment connecting (246, 116) to (4, 63).
; PLAN: r0=246(x1), r1=116(y1), r2=4(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 116
LDI r2, 4
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
