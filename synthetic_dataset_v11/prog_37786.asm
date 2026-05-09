; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (134, 34) spanning 43 by 40 pixels. Then Sets a single red pixel at (5, 34).
; PLAN: r0=134(x), r1=34(y), r2=43(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=5(x), r1=34(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta rectangular region at (134, 34) spanning 43 by 40 pixels.
; PLAN: r0=134(x), r1=34(y), r2=43(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 34
LDI r2, 43
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (5, 34).
; PLAN: r0=5(x), r1=34(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 34
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
