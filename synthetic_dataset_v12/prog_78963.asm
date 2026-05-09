; DESCRIPTION: Draws a magenta rectangle at (346, 167) with width 108 and height 71.
; PLAN: r0=346(x), r1=167(y), r2=108(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 167
LDI r2, 108
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
