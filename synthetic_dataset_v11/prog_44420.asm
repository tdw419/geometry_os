; DESCRIPTION: Renders a purple line between points (6, 246) and (209, 95).
; PLAN: r0=6(x1), r1=246(y1), r2=209(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 246
LDI r2, 209
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
