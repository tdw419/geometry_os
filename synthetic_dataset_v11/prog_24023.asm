; DESCRIPTION: Composite: . Then Sets a single white pixel at (29, 228). Then Places a orange line segment connecting (102, 58) to (143, 201).
; PLAN: r0=29(x), r1=228(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=102(x1), r1=58(y1), r2=143(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (29, 228).
; PLAN: r0=29(x), r1=228(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 228
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (102, 58) to (143, 201).
; PLAN: r0=102(x1), r1=58(y1), r2=143(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 58
LDI r2, 143
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
