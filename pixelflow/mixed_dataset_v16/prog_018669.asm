; DESCRIPTION: Renders a yellow line between points (29, 43) and (182, 102).
; PLAN: r0=29(x1), r1=43(y1), r2=182(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 43
LDI r2, 182
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
