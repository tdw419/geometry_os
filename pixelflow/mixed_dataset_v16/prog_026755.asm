; DESCRIPTION: Renders a yellow line between points (270, 227) and (319, 214).
; PLAN: r0=270(x1), r1=227(y1), r2=319(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 227
LDI r2, 319
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
