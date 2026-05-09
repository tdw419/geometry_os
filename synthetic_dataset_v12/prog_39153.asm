; DESCRIPTION: Renders a yellow line between points (441, 143) and (204, 227).
; PLAN: r0=441(x1), r1=143(y1), r2=204(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 143
LDI r2, 204
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
