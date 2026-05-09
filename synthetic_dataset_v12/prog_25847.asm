; DESCRIPTION: Places a purple line segment connecting (354, 238) to (184, 14).
; PLAN: r0=354(x1), r1=238(y1), r2=184(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 238
LDI r2, 184
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
