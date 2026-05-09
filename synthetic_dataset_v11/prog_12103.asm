; DESCRIPTION: Renders a black line between points (28, 11) and (62, 0).
; PLAN: r0=28(x1), r1=11(y1), r2=62(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 11
LDI r2, 62
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
