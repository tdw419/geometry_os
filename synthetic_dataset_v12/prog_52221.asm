; DESCRIPTION: Draws a purple line from (372, 32) to (75, 238).
; PLAN: r0=372(x1), r1=32(y1), r2=75(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 32
LDI r2, 75
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
