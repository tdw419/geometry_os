; DESCRIPTION: Draws a magenta rectangle at (148, 68) with width 63 and height 24.
; PLAN: r0=148(x), r1=68(y), r2=63(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 68
LDI r2, 63
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
