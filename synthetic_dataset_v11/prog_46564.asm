; DESCRIPTION: Composite: . Then Sets a single red pixel at (169, 66). Then Creates a red rectangular region at (20, 105) spanning 56 by 67 pixels.
; PLAN: r0=169(x), r1=66(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=20(x), r1=105(y), r2=56(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (169, 66).
; PLAN: r0=169(x), r1=66(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 66
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (20, 105) spanning 56 by 67 pixels.
; PLAN: r0=20(x), r1=105(y), r2=56(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 105
LDI r2, 56
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
