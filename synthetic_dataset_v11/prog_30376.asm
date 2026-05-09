; DESCRIPTION: Composite: . Then Draws a white rectangle at (26, 106) with width 114 and height 51. Then Draws a white circle centered at (233, 87) with radius 19.
; PLAN: r0=26(x), r1=106(y), r2=114(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=233(x), r1=87(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (26, 106) with width 114 and height 51.
; PLAN: r0=26(x), r1=106(y), r2=114(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 106
LDI r2, 114
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (233, 87) with radius 19.
; PLAN: r0=233(x), r1=87(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 87
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
