; DESCRIPTION: Renders a green line between points (24, 254) and (253, 251).
; PLAN: r0=24(x1), r1=254(y1), r2=253(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 254
LDI r2, 253
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
