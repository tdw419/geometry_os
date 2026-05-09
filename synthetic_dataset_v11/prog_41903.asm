; DESCRIPTION: Composite: . Then Places a orange dot at position (41, 156). Then Draws a green rectangle at (84, 6) with width 72 and height 35.
; PLAN: r0=41(x), r1=156(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=84(x), r1=6(y), r2=72(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (41, 156).
; PLAN: r0=41(x), r1=156(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 156
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a green rectangle at (84, 6) with width 72 and height 35.
; PLAN: r0=84(x), r1=6(y), r2=72(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 6
LDI r2, 72
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
