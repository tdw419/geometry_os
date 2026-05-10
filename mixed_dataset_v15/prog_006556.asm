; DESCRIPTION: Renders a black line between points (437, 251) and (337, 211).
; PLAN: r0=437(x1), r1=251(y1), r2=337(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 251
LDI r2, 337
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
