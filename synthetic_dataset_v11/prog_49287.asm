; DESCRIPTION: Draws a magenta rectangle at (43, 214) with width 24 and height 39.
; PLAN: r0=43(x), r1=214(y), r2=24(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 214
LDI r2, 24
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
