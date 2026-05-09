; DESCRIPTION: Composite: . Then Places a cyan dot at position (154, 60). Then Draws a black circle centered at (183, 191) with radius 21.
; PLAN: r0=154(x), r1=60(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=183(x), r1=191(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (154, 60).
; PLAN: r0=154(x), r1=60(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 60
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (183, 191) with radius 21.
; PLAN: r0=183(x), r1=191(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 191
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
