; DESCRIPTION: Draws a black line from (52, 139) to (299, 175).
; PLAN: r0=52(x1), r1=139(y1), r2=299(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 139
LDI r2, 299
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
