; DESCRIPTION: Renders a white line between points (351, 132) and (44, 173).
; PLAN: r0=351(x1), r1=132(y1), r2=44(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 132
LDI r2, 44
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
