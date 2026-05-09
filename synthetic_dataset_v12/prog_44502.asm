; DESCRIPTION: Places a black line segment connecting (118, 91) to (345, 207).
; PLAN: r0=118(x1), r1=91(y1), r2=345(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 91
LDI r2, 345
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
