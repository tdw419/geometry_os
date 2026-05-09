; DESCRIPTION: Composite: . Then Sets a single red pixel at (197, 183). Then Creates a magenta rectangular region at (75, 28) spanning 43 by 58 pixels.
; PLAN: r0=197(x), r1=183(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=75(x), r1=28(y), r2=43(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (197, 183).
; PLAN: r0=197(x), r1=183(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 183
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (75, 28) spanning 43 by 58 pixels.
; PLAN: r0=75(x), r1=28(y), r2=43(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 28
LDI r2, 43
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
