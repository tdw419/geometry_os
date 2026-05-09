; DESCRIPTION: Places a cyan line segment connecting (351, 142) to (318, 103).
; PLAN: r0=351(x1), r1=142(y1), r2=318(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 142
LDI r2, 318
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
