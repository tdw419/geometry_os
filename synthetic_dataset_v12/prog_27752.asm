; DESCRIPTION: Places a blue line segment connecting (321, 173) to (323, 224).
; PLAN: r0=321(x1), r1=173(y1), r2=323(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 173
LDI r2, 323
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
