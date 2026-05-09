; DESCRIPTION: Places a white line segment connecting (24, 159) to (420, 24).
; PLAN: r0=24(x1), r1=159(y1), r2=420(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 159
LDI r2, 420
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
