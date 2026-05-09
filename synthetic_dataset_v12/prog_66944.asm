; DESCRIPTION: Places a cyan line segment connecting (318, 49) to (207, 24).
; PLAN: r0=318(x1), r1=49(y1), r2=207(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 49
LDI r2, 207
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
