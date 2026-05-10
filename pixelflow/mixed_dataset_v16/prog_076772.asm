; DESCRIPTION: Places a purple line segment connecting (174, 43) to (14, 237).
; PLAN: r0=174(x1), r1=43(y1), r2=14(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 43
LDI r2, 14
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
