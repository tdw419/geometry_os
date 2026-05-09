; DESCRIPTION: Places a purple line segment connecting (176, 238) to (178, 43).
; PLAN: r0=176(x1), r1=238(y1), r2=178(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 238
LDI r2, 178
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
