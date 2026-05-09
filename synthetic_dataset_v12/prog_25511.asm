; DESCRIPTION: Draws a magenta rectangle at (253, 62) with width 47 and height 36.
; PLAN: r0=253(x), r1=62(y), r2=47(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 62
LDI r2, 47
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
