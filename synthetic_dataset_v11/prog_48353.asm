; DESCRIPTION: Renders a black line between points (81, 38) and (245, 158).
; PLAN: r0=81(x1), r1=38(y1), r2=245(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 38
LDI r2, 245
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
