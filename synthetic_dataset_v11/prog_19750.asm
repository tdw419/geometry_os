; DESCRIPTION: Renders a black line between points (174, 107) and (109, 199).
; PLAN: r0=174(x1), r1=107(y1), r2=109(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 107
LDI r2, 109
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
