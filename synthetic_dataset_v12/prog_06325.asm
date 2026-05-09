; DESCRIPTION: Places a white line segment connecting (478, 148) to (269, 159).
; PLAN: r0=478(x1), r1=148(y1), r2=269(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 148
LDI r2, 269
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
