; DESCRIPTION: Places a black line segment connecting (72, 111) to (351, 67).
; PLAN: r0=72(x1), r1=111(y1), r2=351(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 111
LDI r2, 351
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
