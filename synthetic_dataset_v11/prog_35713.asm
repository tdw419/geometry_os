; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (238, 146) spanning 17 by 19 pixels. Then Sets a single blue pixel at (104, 129).
; PLAN: r0=238(x), r1=146(y), r2=17(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x), r1=129(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta rectangular region at (238, 146) spanning 17 by 19 pixels.
; PLAN: r0=238(x), r1=146(y), r2=17(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 146
LDI r2, 17
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (104, 129).
; PLAN: r0=104(x), r1=129(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 129
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
