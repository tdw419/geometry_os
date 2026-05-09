; DESCRIPTION: Places a black line segment connecting (60, 85) to (115, 207).
; PLAN: r0=60(x1), r1=85(y1), r2=115(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 85
LDI r2, 115
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
