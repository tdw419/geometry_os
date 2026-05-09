; DESCRIPTION: Renders a yellow line between points (204, 107) and (77, 221).
; PLAN: r0=204(x1), r1=107(y1), r2=77(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 107
LDI r2, 77
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
