; DESCRIPTION: Places a purple line segment connecting (215, 246) to (95, 75).
; PLAN: r0=215(x1), r1=246(y1), r2=95(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 246
LDI r2, 95
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
