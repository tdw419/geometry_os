; DESCRIPTION: Places a green line segment connecting (313, 115) to (342, 15).
; PLAN: r0=313(x1), r1=115(y1), r2=342(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 115
LDI r2, 342
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
