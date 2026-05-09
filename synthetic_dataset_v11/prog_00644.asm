; DESCRIPTION: Composite: . Then Draws a green rectangle at (162, 111) with width 54 and height 114. Then Places a magenta dot at position (162, 176).
; PLAN: r0=162(x), r1=111(y), r2=54(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=162(x), r1=176(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green rectangle at (162, 111) with width 54 and height 114.
; PLAN: r0=162(x), r1=111(y), r2=54(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 111
LDI r2, 54
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (162, 176).
; PLAN: r0=162(x), r1=176(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 176
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
