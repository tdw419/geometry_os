; DESCRIPTION: Renders a green line between points (360, 17) and (414, 121).
; PLAN: r0=360(x1), r1=17(y1), r2=414(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 17
LDI r2, 414
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
