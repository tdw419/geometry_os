; DESCRIPTION: Composite: . Then Places a white dot at position (8, 37). Then Draws a magenta rectangle at (160, 171) with width 96 and height 25.
; PLAN: r0=8(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=160(x), r1=171(y), r2=96(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (8, 37).
; PLAN: r0=8(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta rectangle at (160, 171) with width 96 and height 25.
; PLAN: r0=160(x), r1=171(y), r2=96(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 171
LDI r2, 96
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
