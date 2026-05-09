; DESCRIPTION: Places a black line segment connecting (93, 98) to (156, 40).
; PLAN: r0=93(x1), r1=98(y1), r2=156(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 98
LDI r2, 156
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
