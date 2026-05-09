; DESCRIPTION: Places a black line segment connecting (76, 156) to (197, 42).
; PLAN: r0=76(x1), r1=156(y1), r2=197(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 156
LDI r2, 197
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
