; DESCRIPTION: Draws a magenta rectangle at (397, 75) with width 27 and height 40.
; PLAN: r0=397(x), r1=75(y), r2=27(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 75
LDI r2, 27
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
