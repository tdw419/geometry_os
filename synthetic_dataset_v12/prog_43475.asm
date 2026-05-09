; DESCRIPTION: Places a green line segment connecting (265, 61) to (15, 55).
; PLAN: r0=265(x1), r1=61(y1), r2=15(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 61
LDI r2, 15
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
