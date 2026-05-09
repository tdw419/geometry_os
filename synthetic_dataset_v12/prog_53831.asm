; DESCRIPTION: Places a white line segment connecting (181, 230) to (177, 179).
; PLAN: r0=181(x1), r1=230(y1), r2=177(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 230
LDI r2, 177
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
