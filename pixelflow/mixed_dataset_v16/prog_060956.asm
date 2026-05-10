; DESCRIPTION: Places a purple line segment connecting (264, 230) to (27, 70).
; PLAN: r0=264(x1), r1=230(y1), r2=27(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 230
LDI r2, 27
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
