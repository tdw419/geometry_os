; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (127, 119) with width 35 and height 42. Then Places a orange circle of radius 24 at center (166, 116).
; PLAN: r0=127(x), r1=119(y), r2=35(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=166(x), r1=116(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (127, 119) with width 35 and height 42.
; PLAN: r0=127(x), r1=119(y), r2=35(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 119
LDI r2, 35
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 24 at center (166, 116).
; PLAN: r0=166(x), r1=116(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 116
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
