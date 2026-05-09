; DESCRIPTION: Draws a magenta rectangle at (54, 4) with width 83 and height 103.
; PLAN: r0=54(x), r1=4(y), r2=83(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 4
LDI r2, 83
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
