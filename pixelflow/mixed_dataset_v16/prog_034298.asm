; DESCRIPTION: Renders a yellow line between points (272, 8) and (372, 94).
; PLAN: r0=272(x1), r1=8(y1), r2=372(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 8
LDI r2, 372
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
