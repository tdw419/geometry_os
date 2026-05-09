; DESCRIPTION: Places a purple line segment connecting (386, 24) to (332, 255).
; PLAN: r0=386(x1), r1=24(y1), r2=332(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 24
LDI r2, 332
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
