; DESCRIPTION: Places a green line segment connecting (370, 122) to (60, 104).
; PLAN: r0=370(x1), r1=122(y1), r2=60(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 122
LDI r2, 60
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
