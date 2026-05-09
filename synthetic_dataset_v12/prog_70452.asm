; DESCRIPTION: Places a black line segment connecting (396, 28) to (105, 126).
; PLAN: r0=396(x1), r1=28(y1), r2=105(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 28
LDI r2, 105
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
