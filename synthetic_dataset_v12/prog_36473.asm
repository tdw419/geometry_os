; DESCRIPTION: Places a purple line segment connecting (92, 7) to (246, 95).
; PLAN: r0=92(x1), r1=7(y1), r2=246(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 7
LDI r2, 246
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
