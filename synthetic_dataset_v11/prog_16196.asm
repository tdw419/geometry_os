; DESCRIPTION: Composite: . Then Places a blue dot at position (191, 216). Then Draws a purple rectangle at (163, 134) with width 62 and height 32.
; PLAN: r0=191(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=163(x), r1=134(y), r2=62(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (191, 216).
; PLAN: r0=191(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 216
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple rectangle at (163, 134) with width 62 and height 32.
; PLAN: r0=163(x), r1=134(y), r2=62(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 134
LDI r2, 62
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
