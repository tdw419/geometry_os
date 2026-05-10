; DESCRIPTION: Places a white line segment connecting (197, 33) to (25, 34).
; PLAN: r0=197(x1), r1=33(y1), r2=25(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 33
LDI r2, 25
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
