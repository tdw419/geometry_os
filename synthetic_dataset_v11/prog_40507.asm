; DESCRIPTION: Places a white line segment connecting (225, 156) to (103, 126).
; PLAN: r0=225(x1), r1=156(y1), r2=103(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 156
LDI r2, 103
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
