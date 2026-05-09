; DESCRIPTION: Places a purple line segment connecting (264, 209) to (491, 43).
; PLAN: r0=264(x1), r1=209(y1), r2=491(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 209
LDI r2, 491
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
