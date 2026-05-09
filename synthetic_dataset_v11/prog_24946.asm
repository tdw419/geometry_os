; DESCRIPTION: Places a white line segment connecting (126, 169) to (189, 225).
; PLAN: r0=126(x1), r1=169(y1), r2=189(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 169
LDI r2, 189
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
