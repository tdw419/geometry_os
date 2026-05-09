; DESCRIPTION: Composite: . Then Sets a single red pixel at (83, 26). Then Creates a red rectangular region at (60, 49) spanning 29 by 66 pixels.
; PLAN: r0=83(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=60(x), r1=49(y), r2=29(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (83, 26).
; PLAN: r0=83(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 26
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (60, 49) spanning 29 by 66 pixels.
; PLAN: r0=60(x), r1=49(y), r2=29(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 49
LDI r2, 29
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
