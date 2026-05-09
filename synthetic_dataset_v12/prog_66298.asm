; DESCRIPTION: Renders a yellow line between points (115, 167) and (475, 19).
; PLAN: r0=115(x1), r1=167(y1), r2=475(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 167
LDI r2, 475
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
