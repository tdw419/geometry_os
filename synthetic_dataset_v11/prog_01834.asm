; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (68, 67) with radius 66. Then Places a magenta dot at position (240, 149).
; PLAN: r0=68(x), r1=67(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=240(x), r1=149(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (68, 67) with radius 66.
; PLAN: r0=68(x), r1=67(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 67
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (240, 149).
; PLAN: r0=240(x), r1=149(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 149
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
