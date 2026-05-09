; DESCRIPTION: Places a green line segment connecting (255, 76) to (498, 119).
; PLAN: r0=255(x1), r1=76(y1), r2=498(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 76
LDI r2, 498
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
