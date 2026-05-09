; DESCRIPTION: Composite: . Then Creates a black rectangular region at (138, 119) spanning 113 by 96 pixels. Then Sets a single blue pixel at (165, 177).
; PLAN: r0=138(x), r1=119(y), r2=113(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=165(x), r1=177(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (138, 119) spanning 113 by 96 pixels.
; PLAN: r0=138(x), r1=119(y), r2=113(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 119
LDI r2, 113
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (165, 177).
; PLAN: r0=165(x), r1=177(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 177
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
