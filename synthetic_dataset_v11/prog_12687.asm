; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (53, 201). Then Renders a magenta line between points (218, 142) and (244, 94).
; PLAN: r0=53(x), r1=201(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=218(x1), r1=142(y1), r2=244(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (53, 201).
; PLAN: r0=53(x), r1=201(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 201
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta line between points (218, 142) and (244, 94).
; PLAN: r0=218(x1), r1=142(y1), r2=244(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 142
LDI r2, 244
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
