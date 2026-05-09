; DESCRIPTION: Places a white line segment connecting (11, 243) to (244, 11).
; PLAN: r0=11(x1), r1=243(y1), r2=244(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 243
LDI r2, 244
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
