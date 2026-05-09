; DESCRIPTION: Composite: . Then Sets a single black pixel at (83, 67). Then Creates a purple rectangular region at (73, 155) spanning 102 by 24 pixels.
; PLAN: r0=83(x), r1=67(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=73(x), r1=155(y), r2=102(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (83, 67).
; PLAN: r0=83(x), r1=67(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 67
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (73, 155) spanning 102 by 24 pixels.
; PLAN: r0=73(x), r1=155(y), r2=102(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 155
LDI r2, 102
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
