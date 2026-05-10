; DESCRIPTION: Places a white line segment connecting (194, 154) to (387, 179).
; PLAN: r0=194(x1), r1=154(y1), r2=387(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 154
LDI r2, 387
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
