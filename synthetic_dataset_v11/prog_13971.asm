; DESCRIPTION: Places a white line segment connecting (57, 85) to (166, 19).
; PLAN: r0=57(x1), r1=85(y1), r2=166(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 85
LDI r2, 166
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
