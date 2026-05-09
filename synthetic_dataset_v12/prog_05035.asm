; DESCRIPTION: Draws a magenta rectangle at (428, 63) with width 42 and height 60.
; PLAN: r0=428(x), r1=63(y), r2=42(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 63
LDI r2, 42
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
