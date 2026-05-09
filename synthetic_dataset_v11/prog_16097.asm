; DESCRIPTION: Composite: . Then Sets a single black pixel at (85, 199). Then Renders a yellow box of size 83x37 starting at (30, 191).
; PLAN: r0=85(x), r1=199(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=30(x), r1=191(y), r2=83(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (85, 199).
; PLAN: r0=85(x), r1=199(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 199
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 83x37 starting at (30, 191).
; PLAN: r0=30(x), r1=191(y), r2=83(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 191
LDI r2, 83
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
