; DESCRIPTION: Places a purple line segment connecting (306, 106) to (346, 58).
; PLAN: r0=306(x1), r1=106(y1), r2=346(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 106
LDI r2, 346
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
