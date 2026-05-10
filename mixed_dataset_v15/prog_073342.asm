; DESCRIPTION: Places a white line segment connecting (194, 73) to (50, 23).
; PLAN: r0=194(x1), r1=73(y1), r2=50(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 73
LDI r2, 50
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
