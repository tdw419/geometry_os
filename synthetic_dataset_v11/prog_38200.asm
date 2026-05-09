; DESCRIPTION: Places a white line segment connecting (231, 254) to (189, 90).
; PLAN: r0=231(x1), r1=254(y1), r2=189(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 254
LDI r2, 189
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
