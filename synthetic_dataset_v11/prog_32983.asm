; DESCRIPTION: Places a black line segment connecting (63, 113) to (123, 201).
; PLAN: r0=63(x1), r1=113(y1), r2=123(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 113
LDI r2, 123
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
