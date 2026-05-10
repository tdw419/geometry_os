; DESCRIPTION: Renders a black line between points (195, 243) and (86, 1).
; PLAN: r0=195(x1), r1=243(y1), r2=86(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 243
LDI r2, 86
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
