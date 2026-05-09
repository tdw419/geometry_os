; DESCRIPTION: Renders a yellow line between points (86, 222) and (217, 52).
; PLAN: r0=86(x1), r1=222(y1), r2=217(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 222
LDI r2, 217
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
