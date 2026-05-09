; DESCRIPTION: Places a white line segment connecting (506, 68) to (402, 63).
; PLAN: r0=506(x1), r1=68(y1), r2=402(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 68
LDI r2, 402
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
