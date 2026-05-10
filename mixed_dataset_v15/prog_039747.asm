; DESCRIPTION: Places a green line segment connecting (13, 21) to (6, 82).
; PLAN: r0=13(x1), r1=21(y1), r2=6(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 21
LDI r2, 6
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
