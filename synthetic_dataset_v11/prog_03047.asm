; DESCRIPTION: Places a green line segment connecting (75, 6) to (189, 135).
; PLAN: r0=75(x1), r1=6(y1), r2=189(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 6
LDI r2, 189
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
