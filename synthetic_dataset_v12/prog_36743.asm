; DESCRIPTION: Renders a black line between points (449, 247) and (266, 47).
; PLAN: r0=449(x1), r1=247(y1), r2=266(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 247
LDI r2, 266
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
