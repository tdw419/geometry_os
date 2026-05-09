; DESCRIPTION: Renders a yellow line between points (265, 76) and (221, 114).
; PLAN: r0=265(x1), r1=76(y1), r2=221(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 76
LDI r2, 221
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
