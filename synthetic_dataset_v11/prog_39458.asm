; DESCRIPTION: Composite: . Then Sets a single purple pixel at (68, 241). Then Places a magenta line segment connecting (201, 55) to (200, 103).
; PLAN: r0=68(x), r1=241(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=201(x1), r1=55(y1), r2=200(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (68, 241).
; PLAN: r0=68(x), r1=241(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 241
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (201, 55) to (200, 103).
; PLAN: r0=201(x1), r1=55(y1), r2=200(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 55
LDI r2, 200
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
