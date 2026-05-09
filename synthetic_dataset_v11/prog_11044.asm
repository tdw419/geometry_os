; DESCRIPTION: Draws a magenta rectangle at (95, 175) with width 113 and height 42.
; PLAN: r0=95(x), r1=175(y), r2=113(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 175
LDI r2, 113
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
