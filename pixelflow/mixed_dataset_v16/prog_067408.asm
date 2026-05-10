; DESCRIPTION: Renders a yellow line between points (17, 99) and (439, 134).
; PLAN: r0=17(x1), r1=99(y1), r2=439(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 99
LDI r2, 439
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
