; DESCRIPTION: Composite: . Then Renders a orange line between points (68, 104) and (210, 128). Then Sets a single blue pixel at (140, 251).
; PLAN: r0=68(x1), r1=104(y1), r2=210(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=140(x), r1=251(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (68, 104) and (210, 128).
; PLAN: r0=68(x1), r1=104(y1), r2=210(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 104
LDI r2, 210
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (140, 251).
; PLAN: r0=140(x), r1=251(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 251
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
