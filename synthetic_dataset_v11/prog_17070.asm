; DESCRIPTION: Renders a black line between points (54, 102) and (176, 209).
; PLAN: r0=54(x1), r1=102(y1), r2=176(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 102
LDI r2, 176
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
