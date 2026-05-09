; DESCRIPTION: Renders a black line between points (282, 101) and (128, 19).
; PLAN: r0=282(x1), r1=101(y1), r2=128(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 101
LDI r2, 128
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
