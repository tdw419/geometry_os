; DESCRIPTION: Renders a green line between points (156, 52) and (188, 138).
; PLAN: r0=156(x1), r1=52(y1), r2=188(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 52
LDI r2, 188
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
