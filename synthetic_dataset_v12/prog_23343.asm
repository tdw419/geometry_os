; DESCRIPTION: Renders a purple line between points (324, 13) and (437, 32).
; PLAN: r0=324(x1), r1=13(y1), r2=437(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 13
LDI r2, 437
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
