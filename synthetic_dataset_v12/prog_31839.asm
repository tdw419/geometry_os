; DESCRIPTION: Renders a orange line between points (209, 147) and (435, 255).
; PLAN: r0=209(x1), r1=147(y1), r2=435(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 147
LDI r2, 435
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
