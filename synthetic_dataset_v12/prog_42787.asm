; DESCRIPTION: Renders a black line between points (442, 215) and (506, 232).
; PLAN: r0=442(x1), r1=215(y1), r2=506(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 215
LDI r2, 506
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
