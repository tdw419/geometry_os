; DESCRIPTION: Places a white line segment connecting (412, 167) to (32, 235).
; PLAN: r0=412(x1), r1=167(y1), r2=32(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 167
LDI r2, 32
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
