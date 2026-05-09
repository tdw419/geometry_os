; DESCRIPTION: Places a black line segment connecting (62, 179) to (499, 236).
; PLAN: r0=62(x1), r1=179(y1), r2=499(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 179
LDI r2, 499
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
