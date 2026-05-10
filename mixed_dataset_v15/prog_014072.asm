; DESCRIPTION: Renders a black line between points (473, 153) and (331, 21).
; PLAN: r0=473(x1), r1=153(y1), r2=331(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 153
LDI r2, 331
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
