; DESCRIPTION: Composite: . Then Sets a single black pixel at (64, 1). Then Creates a white rectangular region at (165, 1) spanning 58 by 67 pixels.
; PLAN: r0=64(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=165(x), r1=1(y), r2=58(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (64, 1).
; PLAN: r0=64(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a white rectangular region at (165, 1) spanning 58 by 67 pixels.
; PLAN: r0=165(x), r1=1(y), r2=58(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 1
LDI r2, 58
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
