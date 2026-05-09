; DESCRIPTION: Places a black line segment connecting (152, 188) to (114, 235).
; PLAN: r0=152(x1), r1=188(y1), r2=114(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 188
LDI r2, 114
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
