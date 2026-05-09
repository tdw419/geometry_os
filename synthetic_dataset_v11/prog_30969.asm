; DESCRIPTION: Places a black line segment connecting (103, 201) to (54, 60).
; PLAN: r0=103(x1), r1=201(y1), r2=54(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 201
LDI r2, 54
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
