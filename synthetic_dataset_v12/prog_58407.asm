; DESCRIPTION: Renders a black line between points (165, 107) and (490, 208).
; PLAN: r0=165(x1), r1=107(y1), r2=490(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 107
LDI r2, 490
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
