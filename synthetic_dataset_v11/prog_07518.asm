; DESCRIPTION: Places a purple line segment connecting (208, 74) to (68, 24).
; PLAN: r0=208(x1), r1=74(y1), r2=68(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 74
LDI r2, 68
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
