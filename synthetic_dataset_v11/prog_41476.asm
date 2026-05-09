; DESCRIPTION: Draws a magenta rectangle at (165, 170) with width 32 and height 50.
; PLAN: r0=165(x), r1=170(y), r2=32(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 170
LDI r2, 32
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
