; DESCRIPTION: Places a white line segment connecting (322, 66) to (50, 235).
; PLAN: r0=322(x1), r1=66(y1), r2=50(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 66
LDI r2, 50
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
