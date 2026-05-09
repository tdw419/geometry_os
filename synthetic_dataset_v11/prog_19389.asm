; DESCRIPTION: Composite: . Then Sets a single purple pixel at (205, 205). Then Creates a magenta rectangular region at (51, 113) spanning 111 by 17 pixels.
; PLAN: r0=205(x), r1=205(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=51(x), r1=113(y), r2=111(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (205, 205).
; PLAN: r0=205(x), r1=205(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 205
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (51, 113) spanning 111 by 17 pixels.
; PLAN: r0=51(x), r1=113(y), r2=111(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 113
LDI r2, 111
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
