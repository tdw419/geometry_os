; DESCRIPTION: Composite: . Then Renders a white box of size 15x18 starting at (215, 56). Then Places a magenta dot at position (183, 43).
; PLAN: r0=215(x), r1=56(y), r2=15(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=183(x), r1=43(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 15x18 starting at (215, 56).
; PLAN: r0=215(x), r1=56(y), r2=15(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 56
LDI r2, 15
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (183, 43).
; PLAN: r0=183(x), r1=43(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 43
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
