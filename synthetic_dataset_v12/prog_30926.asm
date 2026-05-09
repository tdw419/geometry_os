; DESCRIPTION: Places a green line segment connecting (456, 52) to (90, 172).
; PLAN: r0=456(x1), r1=52(y1), r2=90(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 52
LDI r2, 90
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
