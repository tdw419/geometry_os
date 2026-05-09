; DESCRIPTION: Places a white line segment connecting (433, 176) to (463, 224).
; PLAN: r0=433(x1), r1=176(y1), r2=463(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 176
LDI r2, 463
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
