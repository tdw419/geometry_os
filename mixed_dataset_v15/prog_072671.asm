; DESCRIPTION: Draws a magenta rectangle at (384, 164) with width 35 and height 68.
; PLAN: r0=384(x), r1=164(y), r2=35(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 164
LDI r2, 35
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
