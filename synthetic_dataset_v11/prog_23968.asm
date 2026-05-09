; DESCRIPTION: Places a cyan line segment connecting (150, 251) to (44, 227).
; PLAN: r0=150(x1), r1=251(y1), r2=44(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 251
LDI r2, 44
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
