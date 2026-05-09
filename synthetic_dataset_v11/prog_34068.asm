; DESCRIPTION: Places a white line segment connecting (100, 10) to (175, 82).
; PLAN: r0=100(x1), r1=10(y1), r2=175(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 10
LDI r2, 175
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
