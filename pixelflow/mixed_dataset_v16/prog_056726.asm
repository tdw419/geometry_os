; DESCRIPTION: Places a white line segment connecting (123, 184) to (231, 177).
; PLAN: r0=123(x1), r1=184(y1), r2=231(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 184
LDI r2, 231
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
