; DESCRIPTION: Composite: . Then Draws a white rectangle at (167, 11) with width 62 and height 78. Then Places a black dot at position (108, 203).
; PLAN: r0=167(x), r1=11(y), r2=62(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x), r1=203(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white rectangle at (167, 11) with width 62 and height 78.
; PLAN: r0=167(x), r1=11(y), r2=62(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 11
LDI r2, 62
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (108, 203).
; PLAN: r0=108(x), r1=203(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 203
LDI r2, 0x000000
PSET r0, r1, r2
HALT
