; DESCRIPTION: Draws a magenta rectangle at (58, 29) with width 82 and height 50.
; PLAN: r0=58(x), r1=29(y), r2=82(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 29
LDI r2, 82
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
