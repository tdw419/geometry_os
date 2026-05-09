; DESCRIPTION: Composite: . Then Sets a single white pixel at (230, 72). Then Draws a white rectangle at (65, 166) with width 109 and height 89.
; PLAN: r0=230(x), r1=72(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=65(x), r1=166(y), r2=109(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (230, 72).
; PLAN: r0=230(x), r1=72(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 72
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (65, 166) with width 109 and height 89.
; PLAN: r0=65(x), r1=166(y), r2=109(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 166
LDI r2, 109
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
