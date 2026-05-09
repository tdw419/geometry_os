; DESCRIPTION: Places a white line segment connecting (143, 4) to (120, 97).
; PLAN: r0=143(x1), r1=4(y1), r2=120(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 4
LDI r2, 120
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
