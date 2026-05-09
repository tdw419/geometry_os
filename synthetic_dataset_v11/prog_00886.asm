; DESCRIPTION: Composite: . Then Draws a blue rectangle at (113, 89) with width 117 and height 83. Then Sets a single black pixel at (151, 178).
; PLAN: r0=113(x), r1=89(y), r2=117(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=151(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue rectangle at (113, 89) with width 117 and height 83.
; PLAN: r0=113(x), r1=89(y), r2=117(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 89
LDI r2, 117
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (151, 178).
; PLAN: r0=151(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 178
LDI r2, 0x000000
PSET r0, r1, r2
HALT
