; DESCRIPTION: Draws a magenta rectangle at (63, 148) with width 109 and height 56.
; PLAN: r0=63(x), r1=148(y), r2=109(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 148
LDI r2, 109
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
