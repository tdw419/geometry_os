; DESCRIPTION: Draws a magenta rectangle at (143, 154) with width 76 and height 83.
; PLAN: r0=143(x), r1=154(y), r2=76(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 154
LDI r2, 76
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
