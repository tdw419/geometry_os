; DESCRIPTION: Places a black line segment connecting (52, 16) to (212, 93).
; PLAN: r0=52(x1), r1=16(y1), r2=212(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 16
LDI r2, 212
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
