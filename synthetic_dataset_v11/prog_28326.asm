; DESCRIPTION: Draws a magenta rectangle at (120, 42) with width 24 and height 107.
; PLAN: r0=120(x), r1=42(y), r2=24(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 42
LDI r2, 24
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
