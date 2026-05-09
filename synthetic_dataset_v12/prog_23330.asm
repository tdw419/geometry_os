; DESCRIPTION: Renders a black line between points (487, 147) and (332, 103).
; PLAN: r0=487(x1), r1=147(y1), r2=332(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 147
LDI r2, 332
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
