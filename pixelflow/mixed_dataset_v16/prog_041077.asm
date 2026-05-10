; DESCRIPTION: Places a white line segment connecting (21, 87) to (63, 26).
; PLAN: r0=21(x1), r1=87(y1), r2=63(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 87
LDI r2, 63
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
