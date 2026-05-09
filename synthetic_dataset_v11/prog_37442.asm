; DESCRIPTION: Places a white line segment connecting (192, 214) to (83, 57).
; PLAN: r0=192(x1), r1=214(y1), r2=83(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 214
LDI r2, 83
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
