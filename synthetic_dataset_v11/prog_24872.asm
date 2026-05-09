; DESCRIPTION: Renders a black line between points (141, 25) and (213, 66).
; PLAN: r0=141(x1), r1=25(y1), r2=213(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 25
LDI r2, 213
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
