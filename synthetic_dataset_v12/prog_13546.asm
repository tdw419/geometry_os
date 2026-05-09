; DESCRIPTION: Renders a blue line between points (351, 173) and (378, 60).
; PLAN: r0=351(x1), r1=173(y1), r2=378(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 173
LDI r2, 378
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
