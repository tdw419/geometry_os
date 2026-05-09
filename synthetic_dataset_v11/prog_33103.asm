; DESCRIPTION: Composite: . Then Sets a single white pixel at (226, 134). Then Draws a green rectangle at (67, 89) with width 28 and height 103.
; PLAN: r0=226(x), r1=134(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=67(x), r1=89(y), r2=28(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (226, 134).
; PLAN: r0=226(x), r1=134(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 134
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a green rectangle at (67, 89) with width 28 and height 103.
; PLAN: r0=67(x), r1=89(y), r2=28(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 89
LDI r2, 28
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
