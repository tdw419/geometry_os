; DESCRIPTION: Composite: . Then Sets a single orange pixel at (135, 155). Then Places a orange circle of radius 32 at center (157, 54).
; PLAN: r0=135(x), r1=155(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=157(x), r1=54(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (135, 155).
; PLAN: r0=135(x), r1=155(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 155
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a orange circle of radius 32 at center (157, 54).
; PLAN: r0=157(x), r1=54(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 54
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
