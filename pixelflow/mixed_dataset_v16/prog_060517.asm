; DESCRIPTION: Places a green line segment connecting (460, 245) to (93, 33).
; PLAN: r0=460(x1), r1=245(y1), r2=93(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 245
LDI r2, 93
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
