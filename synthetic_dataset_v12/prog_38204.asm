; DESCRIPTION: Places a black line segment connecting (227, 235) to (303, 176).
; PLAN: r0=227(x1), r1=235(y1), r2=303(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 235
LDI r2, 303
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
