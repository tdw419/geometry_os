; DESCRIPTION: Composite: . Then Places a magenta dot at position (99, 129). Then Draws a green rectangle at (121, 100) with width 74 and height 25.
; PLAN: r0=99(x), r1=129(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=121(x), r1=100(y), r2=74(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (99, 129).
; PLAN: r0=99(x), r1=129(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 129
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a green rectangle at (121, 100) with width 74 and height 25.
; PLAN: r0=121(x), r1=100(y), r2=74(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 100
LDI r2, 74
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
