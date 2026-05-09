; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (138, 51) with width 100 and height 50. Then Places a magenta dot at position (159, 98).
; PLAN: r0=138(x), r1=51(y), r2=100(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=159(x), r1=98(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (138, 51) with width 100 and height 50.
; PLAN: r0=138(x), r1=51(y), r2=100(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 51
LDI r2, 100
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (159, 98).
; PLAN: r0=159(x), r1=98(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 98
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
