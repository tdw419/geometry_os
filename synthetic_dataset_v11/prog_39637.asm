; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (218, 107). Then Places a white line segment connecting (157, 74) to (149, 201).
; PLAN: r0=218(x), r1=107(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=157(x1), r1=74(y1), r2=149(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (218, 107).
; PLAN: r0=218(x), r1=107(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 107
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a white line segment connecting (157, 74) to (149, 201).
; PLAN: r0=157(x1), r1=74(y1), r2=149(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 74
LDI r2, 149
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
