; DESCRIPTION: Renders a black line between points (108, 161) and (183, 116).
; PLAN: r0=108(x1), r1=161(y1), r2=183(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 161
LDI r2, 183
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
