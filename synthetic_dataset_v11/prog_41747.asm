; DESCRIPTION: Places a white line segment connecting (171, 189) to (189, 227).
; PLAN: r0=171(x1), r1=189(y1), r2=189(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 189
LDI r2, 189
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
