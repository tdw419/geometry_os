; DESCRIPTION: Places a black line segment connecting (235, 199) to (213, 188).
; PLAN: r0=235(x1), r1=199(y1), r2=213(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 199
LDI r2, 213
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
