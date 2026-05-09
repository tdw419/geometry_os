; DESCRIPTION: Places a cyan line segment connecting (101, 138) to (53, 245).
; PLAN: r0=101(x1), r1=138(y1), r2=53(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 138
LDI r2, 53
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
