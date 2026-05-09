; DESCRIPTION: Renders a yellow line between points (29, 228) and (155, 89).
; PLAN: r0=29(x1), r1=228(y1), r2=155(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 228
LDI r2, 155
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
