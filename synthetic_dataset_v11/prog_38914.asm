; DESCRIPTION: Composite: . Then Places a orange dot at position (122, 120). Then Draws a magenta rectangle at (65, 82) with width 57 and height 114.
; PLAN: r0=122(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=65(x), r1=82(y), r2=57(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (122, 120).
; PLAN: r0=122(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 120
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta rectangle at (65, 82) with width 57 and height 114.
; PLAN: r0=65(x), r1=82(y), r2=57(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 82
LDI r2, 57
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
