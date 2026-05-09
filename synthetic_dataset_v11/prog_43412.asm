; DESCRIPTION: Places a yellow line segment connecting (6, 76) to (75, 240).
; PLAN: r0=6(x1), r1=76(y1), r2=75(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 76
LDI r2, 75
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
