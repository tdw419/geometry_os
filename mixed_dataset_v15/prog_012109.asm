; DESCRIPTION: Renders a yellow line between points (326, 193) and (372, 137).
; PLAN: r0=326(x1), r1=193(y1), r2=372(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 193
LDI r2, 372
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
