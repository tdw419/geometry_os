; DESCRIPTION: Places a purple line segment connecting (117, 96) to (82, 88).
; PLAN: r0=117(x1), r1=96(y1), r2=82(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 96
LDI r2, 82
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
