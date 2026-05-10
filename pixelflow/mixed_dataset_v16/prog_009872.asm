; DESCRIPTION: Draws a magenta rectangle at (395, 43) with width 65 and height 93.
; PLAN: r0=395(x), r1=43(y), r2=65(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 43
LDI r2, 65
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
