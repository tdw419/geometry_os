; DESCRIPTION: Places a cyan line segment connecting (202, 105) to (232, 130).
; PLAN: r0=202(x1), r1=105(y1), r2=232(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 105
LDI r2, 232
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
