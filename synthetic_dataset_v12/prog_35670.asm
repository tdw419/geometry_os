; DESCRIPTION: Places a purple line segment connecting (67, 75) to (292, 209).
; PLAN: r0=67(x1), r1=75(y1), r2=292(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 75
LDI r2, 292
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
