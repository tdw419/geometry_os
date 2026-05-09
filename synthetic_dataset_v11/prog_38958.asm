; DESCRIPTION: Places a purple line segment connecting (224, 102) to (238, 41).
; PLAN: r0=224(x1), r1=102(y1), r2=238(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 102
LDI r2, 238
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
