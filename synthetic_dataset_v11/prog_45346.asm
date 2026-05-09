; DESCRIPTION: Composite: . Then Places a red dot at position (247, 146). Then Draws a magenta rectangle at (129, 69) with width 24 and height 86.
; PLAN: r0=247(x), r1=146(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=129(x), r1=69(y), r2=24(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (247, 146).
; PLAN: r0=247(x), r1=146(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 146
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta rectangle at (129, 69) with width 24 and height 86.
; PLAN: r0=129(x), r1=69(y), r2=24(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 69
LDI r2, 24
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
