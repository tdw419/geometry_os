; DESCRIPTION: Draws a magenta rectangle at (5, 111) with width 76 and height 32.
; PLAN: r0=5(x), r1=111(y), r2=76(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 111
LDI r2, 76
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
