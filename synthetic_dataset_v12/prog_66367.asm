; DESCRIPTION: Renders a yellow line between points (6, 194) and (102, 156).
; PLAN: r0=6(x1), r1=194(y1), r2=102(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 194
LDI r2, 102
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
