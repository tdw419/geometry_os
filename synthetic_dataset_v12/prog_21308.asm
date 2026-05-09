; DESCRIPTION: Draws a magenta rectangle at (63, 42) with width 111 and height 31.
; PLAN: r0=63(x), r1=42(y), r2=111(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 42
LDI r2, 111
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
