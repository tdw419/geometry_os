; DESCRIPTION: Places a white line segment connecting (63, 224) to (183, 54).
; PLAN: r0=63(x1), r1=224(y1), r2=183(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 224
LDI r2, 183
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
