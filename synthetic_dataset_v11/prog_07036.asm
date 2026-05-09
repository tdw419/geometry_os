; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (105, 69) with width 32 and height 71. Then Places a magenta dot at position (51, 135).
; PLAN: r0=105(x), r1=69(y), r2=32(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=51(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (105, 69) with width 32 and height 71.
; PLAN: r0=105(x), r1=69(y), r2=32(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 69
LDI r2, 32
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (51, 135).
; PLAN: r0=51(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 135
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
