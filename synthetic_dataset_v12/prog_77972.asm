; DESCRIPTION: Draws a magenta rectangle at (2, 120) with width 53 and height 55.
; PLAN: r0=2(x), r1=120(y), r2=53(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 120
LDI r2, 53
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
