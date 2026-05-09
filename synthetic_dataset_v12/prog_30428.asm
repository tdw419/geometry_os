; DESCRIPTION: Places a black line segment connecting (370, 207) to (48, 157).
; PLAN: r0=370(x1), r1=207(y1), r2=48(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 207
LDI r2, 48
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
