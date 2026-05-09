; DESCRIPTION: Draws a magenta rectangle at (136, 82) with width 64 and height 78.
; PLAN: r0=136(x), r1=82(y), r2=64(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 82
LDI r2, 64
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
