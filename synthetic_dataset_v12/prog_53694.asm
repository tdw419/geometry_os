; DESCRIPTION: Renders a yellow line between points (372, 249) and (432, 211).
; PLAN: r0=372(x1), r1=249(y1), r2=432(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 249
LDI r2, 432
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
