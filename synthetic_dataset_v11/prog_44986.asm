; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (46, 171) with width 60 and height 76. Then Sets a single magenta pixel at (212, 24).
; PLAN: r0=46(x), r1=171(y), r2=60(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=212(x), r1=24(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (46, 171) with width 60 and height 76.
; PLAN: r0=46(x), r1=171(y), r2=60(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 171
LDI r2, 60
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (212, 24).
; PLAN: r0=212(x), r1=24(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 24
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
