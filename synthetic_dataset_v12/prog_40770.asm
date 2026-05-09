; DESCRIPTION: Places a purple line segment connecting (269, 21) to (377, 166).
; PLAN: r0=269(x1), r1=21(y1), r2=377(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 21
LDI r2, 377
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
