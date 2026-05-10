; DESCRIPTION: Places a white line segment connecting (98, 77) to (235, 26).
; PLAN: r0=98(x1), r1=77(y1), r2=235(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 77
LDI r2, 235
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
