; DESCRIPTION: Draws a magenta rectangle at (53, 95) with width 28 and height 65.
; PLAN: r0=53(x), r1=95(y), r2=28(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 95
LDI r2, 28
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
