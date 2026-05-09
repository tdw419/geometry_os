; DESCRIPTION: Places a white line segment connecting (85, 24) to (157, 243).
; PLAN: r0=85(x1), r1=24(y1), r2=157(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 24
LDI r2, 157
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
