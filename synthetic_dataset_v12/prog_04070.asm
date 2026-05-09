; DESCRIPTION: Places a green line segment connecting (306, 255) to (9, 61).
; PLAN: r0=306(x1), r1=255(y1), r2=9(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 255
LDI r2, 9
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
