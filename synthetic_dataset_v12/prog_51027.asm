; DESCRIPTION: Places a white line segment connecting (400, 143) to (3, 176).
; PLAN: r0=400(x1), r1=143(y1), r2=3(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 143
LDI r2, 3
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
