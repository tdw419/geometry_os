; DESCRIPTION: Composite: . Then Sets a single black pixel at (31, 210). Then Draws a green rectangle at (155, 98) with width 88 and height 34.
; PLAN: r0=31(x), r1=210(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=155(x), r1=98(y), r2=88(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (31, 210).
; PLAN: r0=31(x), r1=210(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 210
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a green rectangle at (155, 98) with width 88 and height 34.
; PLAN: r0=155(x), r1=98(y), r2=88(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 98
LDI r2, 88
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
