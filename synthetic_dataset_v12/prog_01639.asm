; DESCRIPTION: Places a white line segment connecting (189, 151) to (495, 8).
; PLAN: r0=189(x1), r1=151(y1), r2=495(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 151
LDI r2, 495
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
