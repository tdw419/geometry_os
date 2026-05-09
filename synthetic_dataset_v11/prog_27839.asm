; DESCRIPTION: Places a purple line segment connecting (188, 46) to (114, 209).
; PLAN: r0=188(x1), r1=46(y1), r2=114(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 46
LDI r2, 114
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
