; DESCRIPTION: Renders a yellow line between points (77, 197) and (225, 232).
; PLAN: r0=77(x1), r1=197(y1), r2=225(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 197
LDI r2, 225
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
