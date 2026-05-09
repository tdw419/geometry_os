; DESCRIPTION: Places a white line segment connecting (11, 231) to (194, 221).
; PLAN: r0=11(x1), r1=231(y1), r2=194(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 231
LDI r2, 194
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
