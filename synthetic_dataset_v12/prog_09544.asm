; DESCRIPTION: Draws a magenta rectangle at (421, 20) with width 82 and height 40.
; PLAN: r0=421(x), r1=20(y), r2=82(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 20
LDI r2, 82
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
