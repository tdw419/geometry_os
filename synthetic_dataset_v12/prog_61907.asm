; DESCRIPTION: Draws a magenta rectangle at (346, 98) with width 26 and height 108.
; PLAN: r0=346(x), r1=98(y), r2=26(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 98
LDI r2, 26
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
