; DESCRIPTION: Renders a black line between points (49, 25) and (253, 19).
; PLAN: r0=49(x1), r1=25(y1), r2=253(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 25
LDI r2, 253
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
