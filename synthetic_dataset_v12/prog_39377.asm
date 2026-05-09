; DESCRIPTION: Places a purple line segment connecting (303, 233) to (75, 49).
; PLAN: r0=303(x1), r1=233(y1), r2=75(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 233
LDI r2, 75
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
