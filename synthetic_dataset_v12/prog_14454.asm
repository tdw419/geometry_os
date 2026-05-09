; DESCRIPTION: Draws a purple line from (326, 93) to (64, 201).
; PLAN: r0=326(x1), r1=93(y1), r2=64(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 93
LDI r2, 64
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
