; DESCRIPTION: Renders a green line between points (36, 107) and (253, 22).
; PLAN: r0=36(x1), r1=107(y1), r2=253(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 107
LDI r2, 253
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
