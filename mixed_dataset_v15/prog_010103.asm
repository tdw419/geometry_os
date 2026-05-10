; DESCRIPTION: Renders a black line between points (223, 168) and (122, 64).
; PLAN: r0=223(x1), r1=168(y1), r2=122(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 168
LDI r2, 122
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
