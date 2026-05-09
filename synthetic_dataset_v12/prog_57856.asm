; DESCRIPTION: Places a cyan line segment connecting (286, 184) to (162, 245).
; PLAN: r0=286(x1), r1=184(y1), r2=162(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 184
LDI r2, 162
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
