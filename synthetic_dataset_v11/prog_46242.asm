; DESCRIPTION: Renders a yellow line between points (233, 38) and (81, 31).
; PLAN: r0=233(x1), r1=38(y1), r2=81(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 38
LDI r2, 81
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
