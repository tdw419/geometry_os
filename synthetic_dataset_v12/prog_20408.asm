; DESCRIPTION: Draws a magenta rectangle at (197, 8) with width 76 and height 101.
; PLAN: r0=197(x), r1=8(y), r2=76(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 8
LDI r2, 76
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
