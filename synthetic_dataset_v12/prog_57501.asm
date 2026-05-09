; DESCRIPTION: Places a white line segment connecting (336, 64) to (460, 235).
; PLAN: r0=336(x1), r1=64(y1), r2=460(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 64
LDI r2, 460
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
