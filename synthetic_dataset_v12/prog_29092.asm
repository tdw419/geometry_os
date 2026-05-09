; DESCRIPTION: Places a white line segment connecting (434, 201) to (68, 24).
; PLAN: r0=434(x1), r1=201(y1), r2=68(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 201
LDI r2, 68
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
