; DESCRIPTION: Composite: . Then Sets a single red pixel at (125, 252). Then Creates a magenta rectangular region at (91, 15) spanning 102 by 39 pixels.
; PLAN: r0=125(x), r1=252(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=91(x), r1=15(y), r2=102(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (125, 252).
; PLAN: r0=125(x), r1=252(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 252
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (91, 15) spanning 102 by 39 pixels.
; PLAN: r0=91(x), r1=15(y), r2=102(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 15
LDI r2, 102
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
