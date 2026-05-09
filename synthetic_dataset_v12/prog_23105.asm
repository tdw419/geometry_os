; DESCRIPTION: Places a white line segment connecting (465, 139) to (43, 120).
; PLAN: r0=465(x1), r1=139(y1), r2=43(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 139
LDI r2, 43
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
