; DESCRIPTION: Places a white line segment connecting (128, 11) to (94, 165).
; PLAN: r0=128(x1), r1=11(y1), r2=94(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 11
LDI r2, 94
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
