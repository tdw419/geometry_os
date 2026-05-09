; DESCRIPTION: Composite: . Then Places a green dot at position (167, 14). Then Draws a blue rectangle at (155, 216) with width 44 and height 35.
; PLAN: r0=167(x), r1=14(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=155(x), r1=216(y), r2=44(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (167, 14).
; PLAN: r0=167(x), r1=14(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 14
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a blue rectangle at (155, 216) with width 44 and height 35.
; PLAN: r0=155(x), r1=216(y), r2=44(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 216
LDI r2, 44
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
