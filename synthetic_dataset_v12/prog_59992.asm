; DESCRIPTION: Renders a purple line between points (31, 107) and (32, 240).
; PLAN: r0=31(x1), r1=107(y1), r2=32(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 107
LDI r2, 32
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
