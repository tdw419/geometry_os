; DESCRIPTION: Composite: . Then Sets a single orange pixel at (11, 90). Then Draws a orange rectangle at (78, 117) with width 69 and height 117.
; PLAN: r0=11(x), r1=90(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=78(x), r1=117(y), r2=69(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (11, 90).
; PLAN: r0=11(x), r1=90(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 90
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (78, 117) with width 69 and height 117.
; PLAN: r0=78(x), r1=117(y), r2=69(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 117
LDI r2, 69
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
