; DESCRIPTION: Places a white line segment connecting (77, 107) to (184, 149).
; PLAN: r0=77(x1), r1=107(y1), r2=184(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 107
LDI r2, 184
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
