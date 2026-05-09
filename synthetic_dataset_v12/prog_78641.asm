; DESCRIPTION: Places a purple line segment connecting (175, 4) to (317, 6).
; PLAN: r0=175(x1), r1=4(y1), r2=317(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 4
LDI r2, 317
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
