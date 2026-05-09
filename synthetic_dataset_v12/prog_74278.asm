; DESCRIPTION: Places a purple line segment connecting (368, 125) to (58, 136).
; PLAN: r0=368(x1), r1=125(y1), r2=58(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 125
LDI r2, 58
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
