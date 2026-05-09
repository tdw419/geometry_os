; DESCRIPTION: Composite: . Then Places a red dot at position (18, 67). Then Draws a red rectangle at (155, 149) with width 19 and height 50.
; PLAN: r0=18(x), r1=67(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=155(x), r1=149(y), r2=19(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (18, 67).
; PLAN: r0=18(x), r1=67(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 67
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a red rectangle at (155, 149) with width 19 and height 50.
; PLAN: r0=155(x), r1=149(y), r2=19(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 149
LDI r2, 19
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
