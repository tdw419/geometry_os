; DESCRIPTION: Places a cyan line segment connecting (318, 43) to (368, 251).
; PLAN: r0=318(x1), r1=43(y1), r2=368(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 43
LDI r2, 368
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
