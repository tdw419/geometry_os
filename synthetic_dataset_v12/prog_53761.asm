; DESCRIPTION: Places a green line segment connecting (165, 175) to (140, 38).
; PLAN: r0=165(x1), r1=175(y1), r2=140(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 175
LDI r2, 140
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
