; DESCRIPTION: Renders a black line between points (94, 195) and (129, 254).
; PLAN: r0=94(x1), r1=195(y1), r2=129(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 195
LDI r2, 129
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
