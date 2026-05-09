; DESCRIPTION: Places a purple line segment connecting (189, 211) to (65, 50).
; PLAN: r0=189(x1), r1=211(y1), r2=65(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 211
LDI r2, 65
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
