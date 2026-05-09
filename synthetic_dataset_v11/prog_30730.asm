; DESCRIPTION: Places a white line segment connecting (130, 84) to (114, 235).
; PLAN: r0=130(x1), r1=84(y1), r2=114(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 84
LDI r2, 114
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
