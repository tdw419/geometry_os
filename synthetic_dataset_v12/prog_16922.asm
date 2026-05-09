; DESCRIPTION: Renders a black line between points (88, 71) and (47, 243).
; PLAN: r0=88(x1), r1=71(y1), r2=47(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 71
LDI r2, 47
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
