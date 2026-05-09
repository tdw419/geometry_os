; DESCRIPTION: Places a white line segment connecting (58, 140) to (134, 236).
; PLAN: r0=58(x1), r1=140(y1), r2=134(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 140
LDI r2, 134
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
