; DESCRIPTION: Renders a black line between points (15, 107) and (204, 16).
; PLAN: r0=15(x1), r1=107(y1), r2=204(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 107
LDI r2, 204
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
