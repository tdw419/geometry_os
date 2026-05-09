; DESCRIPTION: Draws a magenta rectangle at (375, 24) with width 103 and height 50.
; PLAN: r0=375(x), r1=24(y), r2=103(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 24
LDI r2, 103
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
