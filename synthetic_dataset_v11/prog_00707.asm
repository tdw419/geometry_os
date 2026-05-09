; DESCRIPTION: Places a white line segment connecting (4, 4) to (12, 64).
; PLAN: r0=4(x1), r1=4(y1), r2=12(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 4
LDI r2, 12
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
