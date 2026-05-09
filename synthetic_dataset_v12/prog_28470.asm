; DESCRIPTION: Renders a black line between points (325, 139) and (396, 171).
; PLAN: r0=325(x1), r1=139(y1), r2=396(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 139
LDI r2, 396
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
