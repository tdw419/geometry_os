; DESCRIPTION: Draws a magenta rectangle at (60, 94) with width 29 and height 42.
; PLAN: r0=60(x), r1=94(y), r2=29(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 94
LDI r2, 29
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
