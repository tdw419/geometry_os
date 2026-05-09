; DESCRIPTION: Renders a yellow line between points (189, 153) and (107, 54).
; PLAN: r0=189(x1), r1=153(y1), r2=107(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 153
LDI r2, 107
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
