; DESCRIPTION: Renders a yellow line between points (496, 248) and (273, 176).
; PLAN: r0=496(x1), r1=248(y1), r2=273(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 248
LDI r2, 273
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
