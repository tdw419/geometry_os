; DESCRIPTION: Renders a black line between points (222, 85) and (384, 71).
; PLAN: r0=222(x1), r1=85(y1), r2=384(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 85
LDI r2, 384
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
