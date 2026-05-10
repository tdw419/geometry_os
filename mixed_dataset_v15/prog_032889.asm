; DESCRIPTION: Places a white line segment connecting (32, 254) to (323, 203).
; PLAN: r0=32(x1), r1=254(y1), r2=323(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 254
LDI r2, 323
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
