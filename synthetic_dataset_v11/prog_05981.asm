; DESCRIPTION: Draws a magenta rectangle at (93, 36) with width 53 and height 70.
; PLAN: r0=93(x), r1=36(y), r2=53(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 36
LDI r2, 53
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
