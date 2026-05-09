; DESCRIPTION: Places a white line segment connecting (249, 139) to (328, 102).
; PLAN: r0=249(x1), r1=139(y1), r2=328(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 139
LDI r2, 328
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
