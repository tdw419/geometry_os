; DESCRIPTION: Renders a purple line between points (230, 31) and (349, 5).
; PLAN: r0=230(x1), r1=31(y1), r2=349(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 31
LDI r2, 349
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
