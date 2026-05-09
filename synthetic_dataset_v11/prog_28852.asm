; DESCRIPTION: Composite: . Then Sets a single green pixel at (163, 148). Then Places a blue line segment connecting (255, 157) to (229, 78).
; PLAN: r0=163(x), r1=148(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=255(x1), r1=157(y1), r2=229(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (163, 148).
; PLAN: r0=163(x), r1=148(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 148
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a blue line segment connecting (255, 157) to (229, 78).
; PLAN: r0=255(x1), r1=157(y1), r2=229(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 157
LDI r2, 229
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
