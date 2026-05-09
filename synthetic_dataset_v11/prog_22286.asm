; DESCRIPTION: Renders a blue line between points (156, 248) and (245, 142).
; PLAN: r0=156(x1), r1=248(y1), r2=245(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 248
LDI r2, 245
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
