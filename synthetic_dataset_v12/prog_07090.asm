; DESCRIPTION: Renders a black line between points (310, 120) and (355, 71).
; PLAN: r0=310(x1), r1=120(y1), r2=355(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 120
LDI r2, 355
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
