; DESCRIPTION: Places a white line segment connecting (132, 28) to (297, 148).
; PLAN: r0=132(x1), r1=28(y1), r2=297(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 28
LDI r2, 297
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
