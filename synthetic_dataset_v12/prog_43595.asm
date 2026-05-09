; DESCRIPTION: Places a purple line segment connecting (248, 118) to (298, 108).
; PLAN: r0=248(x1), r1=118(y1), r2=298(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 118
LDI r2, 298
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
