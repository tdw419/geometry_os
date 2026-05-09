; DESCRIPTION: Draws a magenta rectangle at (137, 111) with width 120 and height 42.
; PLAN: r0=137(x), r1=111(y), r2=120(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 111
LDI r2, 120
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
