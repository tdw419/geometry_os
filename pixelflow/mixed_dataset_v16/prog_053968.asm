; DESCRIPTION: Places a white line segment connecting (318, 32) to (223, 84).
; PLAN: r0=318(x1), r1=32(y1), r2=223(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 32
LDI r2, 223
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
