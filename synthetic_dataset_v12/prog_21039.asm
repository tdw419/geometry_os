; DESCRIPTION: Places a white line segment connecting (440, 201) to (122, 164).
; PLAN: r0=440(x1), r1=201(y1), r2=122(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 201
LDI r2, 122
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
