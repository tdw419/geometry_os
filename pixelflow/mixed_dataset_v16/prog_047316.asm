; DESCRIPTION: Places a purple line segment connecting (210, 93) to (52, 102).
; PLAN: r0=210(x1), r1=93(y1), r2=52(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 93
LDI r2, 52
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
