; DESCRIPTION: Places a white line segment connecting (219, 37) to (402, 47).
; PLAN: r0=219(x1), r1=37(y1), r2=402(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 37
LDI r2, 402
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
