; DESCRIPTION: Draws a magenta rectangle at (381, 82) with width 68 and height 42.
; PLAN: r0=381(x), r1=82(y), r2=68(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 82
LDI r2, 68
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
