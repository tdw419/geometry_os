; DESCRIPTION: Draws a magenta rectangle at (247, 103) with width 63 and height 39.
; PLAN: r0=247(x), r1=103(y), r2=63(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 103
LDI r2, 63
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
