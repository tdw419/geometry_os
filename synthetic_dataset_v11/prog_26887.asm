; DESCRIPTION: Renders a black line between points (19, 114) and (191, 192).
; PLAN: r0=19(x1), r1=114(y1), r2=191(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 114
LDI r2, 191
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
