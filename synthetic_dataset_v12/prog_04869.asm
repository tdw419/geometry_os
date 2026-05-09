; DESCRIPTION: Renders a yellow line between points (478, 25) and (15, 164).
; PLAN: r0=478(x1), r1=25(y1), r2=15(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 25
LDI r2, 15
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
