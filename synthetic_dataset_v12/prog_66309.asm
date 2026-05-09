; DESCRIPTION: Renders a black line between points (329, 88) and (111, 142).
; PLAN: r0=329(x1), r1=88(y1), r2=111(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 88
LDI r2, 111
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
