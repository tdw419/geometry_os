; DESCRIPTION: Renders a black line between points (373, 73) and (471, 206).
; PLAN: r0=373(x1), r1=73(y1), r2=471(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 73
LDI r2, 471
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
