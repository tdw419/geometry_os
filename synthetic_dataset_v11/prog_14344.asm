; DESCRIPTION: Composite: . Then Places a magenta dot at position (70, 238). Then Draws a blue rectangle at (64, 123) with width 14 and height 35.
; PLAN: r0=70(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=64(x), r1=123(y), r2=14(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (70, 238).
; PLAN: r0=70(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue rectangle at (64, 123) with width 14 and height 35.
; PLAN: r0=64(x), r1=123(y), r2=14(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 123
LDI r2, 14
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
