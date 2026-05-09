; DESCRIPTION: Places a white line segment connecting (484, 165) to (26, 236).
; PLAN: r0=484(x1), r1=165(y1), r2=26(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 165
LDI r2, 26
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
