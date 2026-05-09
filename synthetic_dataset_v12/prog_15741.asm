; DESCRIPTION: Renders a black line between points (24, 183) and (277, 189).
; PLAN: r0=24(x1), r1=183(y1), r2=277(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 183
LDI r2, 277
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
