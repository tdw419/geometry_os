; DESCRIPTION: Places a black line segment connecting (127, 115) to (351, 150).
; PLAN: r0=127(x1), r1=115(y1), r2=351(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 115
LDI r2, 351
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
