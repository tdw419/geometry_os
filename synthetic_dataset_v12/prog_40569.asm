; DESCRIPTION: Places a black line segment connecting (459, 67) to (403, 235).
; PLAN: r0=459(x1), r1=67(y1), r2=403(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 67
LDI r2, 403
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
