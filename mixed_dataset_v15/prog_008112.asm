; DESCRIPTION: Places a white line segment connecting (157, 102) to (394, 9).
; PLAN: r0=157(x1), r1=102(y1), r2=394(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 102
LDI r2, 394
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
