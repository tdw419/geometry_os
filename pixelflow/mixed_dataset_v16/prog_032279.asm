; DESCRIPTION: Renders a purple line segment connecting (88, 115) to (215, 54).
; PLAN: r0=88(x1), r1=115(y1), r2=215(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 115
LDI r2, 215
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
