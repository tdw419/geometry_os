; DESCRIPTION: Places a black line segment connecting (45, 196) to (235, 66).
; PLAN: r0=45(x1), r1=196(y1), r2=235(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 196
LDI r2, 235
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
