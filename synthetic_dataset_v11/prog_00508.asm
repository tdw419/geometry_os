; DESCRIPTION: Places a black line segment connecting (211, 116) to (207, 251).
; PLAN: r0=211(x1), r1=116(y1), r2=207(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 116
LDI r2, 207
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
