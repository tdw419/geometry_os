; DESCRIPTION: Composite: . Then Renders a red box of size 37x102 starting at (157, 140). Then Sets a single white pixel at (150, 203).
; PLAN: r0=157(x), r1=140(y), r2=37(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=150(x), r1=203(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red box of size 37x102 starting at (157, 140).
; PLAN: r0=157(x), r1=140(y), r2=37(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 140
LDI r2, 37
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (150, 203).
; PLAN: r0=150(x), r1=203(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 203
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
