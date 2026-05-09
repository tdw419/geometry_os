; DESCRIPTION: Renders a black line between points (137, 43) and (74, 164).
; PLAN: r0=137(x1), r1=43(y1), r2=74(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 43
LDI r2, 74
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
