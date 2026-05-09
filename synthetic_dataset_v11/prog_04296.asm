; DESCRIPTION: Renders a yellow line between points (102, 195) and (29, 181).
; PLAN: r0=102(x1), r1=195(y1), r2=29(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 195
LDI r2, 29
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
