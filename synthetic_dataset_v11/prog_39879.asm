; DESCRIPTION: Renders a yellow line between points (102, 204) and (179, 163).
; PLAN: r0=102(x1), r1=204(y1), r2=179(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 204
LDI r2, 179
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
