; DESCRIPTION: Renders a yellow line between points (226, 39) and (204, 200).
; PLAN: r0=226(x1), r1=39(y1), r2=204(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 39
LDI r2, 204
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
