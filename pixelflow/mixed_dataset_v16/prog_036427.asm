; DESCRIPTION: Draws a magenta rectangle at (64, 167) with width 88 and height 42.
; PLAN: r0=64(x), r1=167(y), r2=88(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 167
LDI r2, 88
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
