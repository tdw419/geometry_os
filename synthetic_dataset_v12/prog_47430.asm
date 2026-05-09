; DESCRIPTION: Renders a white line between points (17, 210) and (149, 62).
; PLAN: r0=17(x1), r1=210(y1), r2=149(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 210
LDI r2, 149
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
