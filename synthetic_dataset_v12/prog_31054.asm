; DESCRIPTION: Places a black line segment connecting (1, 235) to (444, 67).
; PLAN: r0=1(x1), r1=235(y1), r2=444(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 235
LDI r2, 444
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
