; DESCRIPTION: Draws a magenta rectangle at (19, 10) with width 24 and height 82.
; PLAN: r0=19(x), r1=10(y), r2=24(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 10
LDI r2, 24
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
