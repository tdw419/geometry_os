; DESCRIPTION: Renders a purple line between points (239, 169) and (175, 7).
; PLAN: r0=239(x1), r1=169(y1), r2=175(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 169
LDI r2, 175
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
