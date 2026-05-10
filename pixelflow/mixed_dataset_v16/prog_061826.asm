; DESCRIPTION: Renders a black line between points (469, 214) and (402, 31).
; PLAN: r0=469(x1), r1=214(y1), r2=402(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 214
LDI r2, 402
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
