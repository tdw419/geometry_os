; DESCRIPTION: Places a white line segment connecting (21, 253) to (261, 235).
; PLAN: r0=21(x1), r1=253(y1), r2=261(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 253
LDI r2, 261
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
