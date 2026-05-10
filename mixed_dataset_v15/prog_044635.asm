; DESCRIPTION: Renders a yellow line between points (355, 183) and (192, 209).
; PLAN: r0=355(x1), r1=183(y1), r2=192(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 183
LDI r2, 192
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
