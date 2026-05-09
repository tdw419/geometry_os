; DESCRIPTION: Places a white line segment connecting (110, 246) to (63, 137).
; PLAN: r0=110(x1), r1=246(y1), r2=63(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 246
LDI r2, 63
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
