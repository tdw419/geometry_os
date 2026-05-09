; DESCRIPTION: Places a white line segment connecting (28, 73) to (83, 82).
; PLAN: r0=28(x1), r1=73(y1), r2=83(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 73
LDI r2, 83
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
