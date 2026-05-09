; DESCRIPTION: Composite: . Then Places a blue line segment connecting (183, 117) to (142, 45). Then Sets a single yellow pixel at (239, 150).
; PLAN: r0=183(x1), r1=117(y1), r2=142(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=239(x), r1=150(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (183, 117) to (142, 45).
; PLAN: r0=183(x1), r1=117(y1), r2=142(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 117
LDI r2, 142
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (239, 150).
; PLAN: r0=239(x), r1=150(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 150
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
