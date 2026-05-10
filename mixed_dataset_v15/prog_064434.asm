; DESCRIPTION: Renders a red line segment connecting (190, 183) to (64, 87).
; PLAN: r0=190(x1), r1=183(y1), r2=64(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 183
LDI r2, 64
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
