; DESCRIPTION: Places a black line segment connecting (356, 184) to (174, 191).
; PLAN: r0=356(x1), r1=184(y1), r2=174(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 184
LDI r2, 174
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
