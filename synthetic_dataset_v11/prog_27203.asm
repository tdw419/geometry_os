; DESCRIPTION: Renders a yellow line between points (76, 226) and (52, 188).
; PLAN: r0=76(x1), r1=226(y1), r2=52(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 226
LDI r2, 52
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
