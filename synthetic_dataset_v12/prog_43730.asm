; DESCRIPTION: Renders a black line between points (200, 99) and (131, 172).
; PLAN: r0=200(x1), r1=99(y1), r2=131(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 99
LDI r2, 131
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
