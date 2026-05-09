; DESCRIPTION: Renders a black line between points (268, 90) and (449, 233).
; PLAN: r0=268(x1), r1=90(y1), r2=449(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 90
LDI r2, 449
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
