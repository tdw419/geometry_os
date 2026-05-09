; DESCRIPTION: Renders a yellow line between points (151, 52) and (141, 33).
; PLAN: r0=151(x1), r1=52(y1), r2=141(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 52
LDI r2, 141
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
