; DESCRIPTION: Renders a black line between points (38, 17) and (47, 108).
; PLAN: r0=38(x1), r1=17(y1), r2=47(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 17
LDI r2, 47
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
