; DESCRIPTION: Renders a black line between points (185, 208) and (278, 223).
; PLAN: r0=185(x1), r1=208(y1), r2=278(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 208
LDI r2, 278
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
