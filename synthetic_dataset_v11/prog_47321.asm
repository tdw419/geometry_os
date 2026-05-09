; DESCRIPTION: Renders a yellow line between points (52, 185) and (128, 217).
; PLAN: r0=52(x1), r1=185(y1), r2=128(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 185
LDI r2, 128
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
