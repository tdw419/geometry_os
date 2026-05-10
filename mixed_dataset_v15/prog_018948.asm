; DESCRIPTION: Places a white line segment connecting (259, 169) to (72, 103).
; PLAN: r0=259(x1), r1=169(y1), r2=72(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 169
LDI r2, 72
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
