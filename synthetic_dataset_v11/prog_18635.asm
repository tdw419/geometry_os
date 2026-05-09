; DESCRIPTION: Composite: . Then Draws a red rectangle at (113, 23) with width 105 and height 120. Then Places a blue dot at position (139, 9).
; PLAN: r0=113(x), r1=23(y), r2=105(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=139(x), r1=9(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red rectangle at (113, 23) with width 105 and height 120.
; PLAN: r0=113(x), r1=23(y), r2=105(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 23
LDI r2, 105
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (139, 9).
; PLAN: r0=139(x), r1=9(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 9
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
