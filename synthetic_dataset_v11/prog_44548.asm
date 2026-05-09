; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (251, 25). Then Creates a purple rectangular region at (16, 156) spanning 113 by 91 pixels.
; PLAN: r0=251(x), r1=25(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=16(x), r1=156(y), r2=113(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (251, 25).
; PLAN: r0=251(x), r1=25(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 25
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (16, 156) spanning 113 by 91 pixels.
; PLAN: r0=16(x), r1=156(y), r2=113(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 156
LDI r2, 113
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
