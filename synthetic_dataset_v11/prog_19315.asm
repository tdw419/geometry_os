; DESCRIPTION: Renders a black line between points (188, 3) and (183, 170).
; PLAN: r0=188(x1), r1=3(y1), r2=183(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 3
LDI r2, 183
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
