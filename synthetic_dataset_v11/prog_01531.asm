; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (174, 2). Then Draws a white rectangle at (155, 70) with width 17 and height 33.
; PLAN: r0=174(x), r1=2(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=155(x), r1=70(y), r2=17(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (174, 2).
; PLAN: r0=174(x), r1=2(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 2
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (155, 70) with width 17 and height 33.
; PLAN: r0=155(x), r1=70(y), r2=17(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 70
LDI r2, 17
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
