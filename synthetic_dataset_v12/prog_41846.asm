; DESCRIPTION: Draws a magenta rectangle at (239, 137) with width 33 and height 108.
; PLAN: r0=239(x), r1=137(y), r2=33(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 137
LDI r2, 33
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
