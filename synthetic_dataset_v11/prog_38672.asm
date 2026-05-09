; DESCRIPTION: Renders a yellow line between points (37, 223) and (237, 194).
; PLAN: r0=37(x1), r1=223(y1), r2=237(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 223
LDI r2, 237
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
