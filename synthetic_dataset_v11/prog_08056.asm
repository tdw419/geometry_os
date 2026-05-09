; DESCRIPTION: Renders a yellow line between points (227, 228) and (122, 194).
; PLAN: r0=227(x1), r1=228(y1), r2=122(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 228
LDI r2, 122
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
