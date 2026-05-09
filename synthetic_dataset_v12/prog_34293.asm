; DESCRIPTION: Renders a black line between points (337, 49) and (449, 89).
; PLAN: r0=337(x1), r1=49(y1), r2=449(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 49
LDI r2, 449
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
