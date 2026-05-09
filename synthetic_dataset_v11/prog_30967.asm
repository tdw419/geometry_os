; DESCRIPTION: Draws a magenta rectangle at (59, 62) with width 12 and height 93.
; PLAN: r0=59(x), r1=62(y), r2=12(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 62
LDI r2, 12
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
