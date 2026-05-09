; DESCRIPTION: Renders a black line between points (379, 113) and (38, 2).
; PLAN: r0=379(x1), r1=113(y1), r2=38(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 113
LDI r2, 38
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
