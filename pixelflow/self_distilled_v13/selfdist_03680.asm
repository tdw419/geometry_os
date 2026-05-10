; DESCRIPTION: Renders a blue line segment connecting (179, 64) to (35, 67).
; PLAN: r0=179(x1), r1=64(y1), r2=35(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 64
LDI r2, 35
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
