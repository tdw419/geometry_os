; DESCRIPTION: Renders a yellow line between points (305, 253) and (97, 71).
; PLAN: r0=305(x1), r1=253(y1), r2=97(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 253
LDI r2, 97
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
