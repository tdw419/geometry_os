; DESCRIPTION: Composite: . Then Sets a single white pixel at (191, 80). Then Draws a blue rectangle at (95, 113) with width 26 and height 61.
; PLAN: r0=191(x), r1=80(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=95(x), r1=113(y), r2=26(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (191, 80).
; PLAN: r0=191(x), r1=80(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 80
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue rectangle at (95, 113) with width 26 and height 61.
; PLAN: r0=95(x), r1=113(y), r2=26(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 113
LDI r2, 26
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
