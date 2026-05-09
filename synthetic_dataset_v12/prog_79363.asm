; DESCRIPTION: Places a white line segment connecting (90, 212) to (44, 38).
; PLAN: r0=90(x1), r1=212(y1), r2=44(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 212
LDI r2, 44
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
