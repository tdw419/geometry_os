; DESCRIPTION: Places a black line segment connecting (356, 178) to (94, 103).
; PLAN: r0=356(x1), r1=178(y1), r2=94(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 178
LDI r2, 94
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
