; DESCRIPTION: Places a white line segment connecting (12, 46) to (71, 235).
; PLAN: r0=12(x1), r1=46(y1), r2=71(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 46
LDI r2, 71
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
