; DESCRIPTION: Places a purple line segment connecting (298, 184) to (93, 188).
; PLAN: r0=298(x1), r1=184(y1), r2=93(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 184
LDI r2, 93
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
