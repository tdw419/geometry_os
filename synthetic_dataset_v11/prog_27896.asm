; DESCRIPTION: Places a white line segment connecting (102, 45) to (235, 224).
; PLAN: r0=102(x1), r1=45(y1), r2=235(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 45
LDI r2, 235
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
