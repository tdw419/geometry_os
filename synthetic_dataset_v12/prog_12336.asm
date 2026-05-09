; DESCRIPTION: Draws a black line from (70, 217) to (324, 238).
; PLAN: r0=70(x1), r1=217(y1), r2=324(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 217
LDI r2, 324
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
