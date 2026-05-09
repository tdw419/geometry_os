; DESCRIPTION: Renders a yellow line between points (128, 66) and (138, 199).
; PLAN: r0=128(x1), r1=66(y1), r2=138(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 66
LDI r2, 138
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
