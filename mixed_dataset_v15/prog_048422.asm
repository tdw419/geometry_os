; DESCRIPTION: Draws a magenta rectangle at (436, 126) with width 68 and height 42.
; PLAN: r0=436(x), r1=126(y), r2=68(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 126
LDI r2, 68
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
