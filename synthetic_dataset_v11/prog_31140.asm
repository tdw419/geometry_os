; DESCRIPTION: Composite: . Then Sets a single black pixel at (217, 131). Then Creates a blue rectangular region at (3, 47) spanning 71 by 24 pixels.
; PLAN: r0=217(x), r1=131(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=3(x), r1=47(y), r2=71(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (217, 131).
; PLAN: r0=217(x), r1=131(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 131
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (3, 47) spanning 71 by 24 pixels.
; PLAN: r0=3(x), r1=47(y), r2=71(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 47
LDI r2, 71
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
