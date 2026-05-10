; DESCRIPTION: Renders a black line between points (131, 165) and (279, 43).
; PLAN: r0=131(x1), r1=165(y1), r2=279(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 165
LDI r2, 279
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
