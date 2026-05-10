; DESCRIPTION: Renders a yellow line between points (112, 222) and (209, 115).
; PLAN: r0=112(x1), r1=222(y1), r2=209(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 222
LDI r2, 209
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
