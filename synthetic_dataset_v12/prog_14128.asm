; DESCRIPTION: Renders a green line between points (399, 101) and (418, 141).
; PLAN: r0=399(x1), r1=101(y1), r2=418(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 101
LDI r2, 418
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
