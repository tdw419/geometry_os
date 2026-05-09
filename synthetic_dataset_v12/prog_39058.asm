; DESCRIPTION: Renders a green line between points (490, 121) and (81, 244).
; PLAN: r0=490(x1), r1=121(y1), r2=81(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 121
LDI r2, 81
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
