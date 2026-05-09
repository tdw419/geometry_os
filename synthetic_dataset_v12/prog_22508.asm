; DESCRIPTION: Places a black line segment connecting (281, 61) to (49, 226).
; PLAN: r0=281(x1), r1=61(y1), r2=49(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 61
LDI r2, 49
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
