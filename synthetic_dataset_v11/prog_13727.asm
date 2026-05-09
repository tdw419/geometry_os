; DESCRIPTION: Composite: . Then Places a green line segment connecting (255, 225) to (61, 152). Then Sets a single yellow pixel at (20, 171).
; PLAN: r0=255(x1), r1=225(y1), r2=61(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=20(x), r1=171(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (255, 225) to (61, 152).
; PLAN: r0=255(x1), r1=225(y1), r2=61(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 225
LDI r2, 61
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (20, 171).
; PLAN: r0=20(x), r1=171(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 171
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
