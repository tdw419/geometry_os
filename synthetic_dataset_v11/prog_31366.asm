; DESCRIPTION: Places a purple line segment connecting (70, 126) to (197, 238).
; PLAN: r0=70(x1), r1=126(y1), r2=197(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 126
LDI r2, 197
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
