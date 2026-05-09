; DESCRIPTION: Places a white line segment connecting (176, 28) to (85, 137).
; PLAN: r0=176(x1), r1=28(y1), r2=85(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 28
LDI r2, 85
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
