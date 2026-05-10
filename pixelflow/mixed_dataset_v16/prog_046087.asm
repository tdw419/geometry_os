; DESCRIPTION: Places a white line segment connecting (227, 228) to (439, 155).
; PLAN: r0=227(x1), r1=228(y1), r2=439(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 228
LDI r2, 439
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
