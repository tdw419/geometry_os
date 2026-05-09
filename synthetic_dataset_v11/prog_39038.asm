; DESCRIPTION: Places a white line segment connecting (87, 113) to (234, 224).
; PLAN: r0=87(x1), r1=113(y1), r2=234(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 113
LDI r2, 234
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
