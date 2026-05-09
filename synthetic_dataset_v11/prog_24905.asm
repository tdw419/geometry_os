; DESCRIPTION: Composite: . Then Draws a purple rectangle at (145, 171) with width 74 and height 43. Then Places a green dot at position (119, 165).
; PLAN: r0=145(x), r1=171(y), r2=74(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=119(x), r1=165(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple rectangle at (145, 171) with width 74 and height 43.
; PLAN: r0=145(x), r1=171(y), r2=74(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 171
LDI r2, 74
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (119, 165).
; PLAN: r0=119(x), r1=165(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 165
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
