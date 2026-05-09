; DESCRIPTION: Places a green line segment connecting (351, 194) to (169, 150).
; PLAN: r0=351(x1), r1=194(y1), r2=169(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 194
LDI r2, 169
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
