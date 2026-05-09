; DESCRIPTION: Places a white line segment connecting (12, 73) to (64, 235).
; PLAN: r0=12(x1), r1=73(y1), r2=64(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 73
LDI r2, 64
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
