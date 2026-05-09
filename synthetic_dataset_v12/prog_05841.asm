; DESCRIPTION: Renders a black line between points (134, 103) and (43, 85).
; PLAN: r0=134(x1), r1=103(y1), r2=43(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 103
LDI r2, 43
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
