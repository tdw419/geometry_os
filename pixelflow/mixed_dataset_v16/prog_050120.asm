; DESCRIPTION: Places a black line segment connecting (235, 128) to (342, 128).
; PLAN: r0=235(x1), r1=128(y1), r2=342(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 128
LDI r2, 342
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
