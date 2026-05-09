; DESCRIPTION: Renders a yellow line between points (16, 253) and (245, 251).
; PLAN: r0=16(x1), r1=253(y1), r2=245(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 253
LDI r2, 245
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
