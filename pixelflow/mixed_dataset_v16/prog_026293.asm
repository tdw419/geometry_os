; DESCRIPTION: Places a white line segment connecting (256, 240) to (341, 179).
; PLAN: r0=256(x1), r1=240(y1), r2=341(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 240
LDI r2, 341
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
