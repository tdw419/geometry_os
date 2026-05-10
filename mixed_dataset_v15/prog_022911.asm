; DESCRIPTION: Renders a black line between points (93, 11) and (469, 27).
; PLAN: r0=93(x1), r1=11(y1), r2=469(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 11
LDI r2, 469
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
