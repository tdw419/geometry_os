; DESCRIPTION: Renders a green line segment connecting (383, 75) to (261, 141).
; PLAN: r0=383(x1), r1=75(y1), r2=261(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 75
LDI r2, 261
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
