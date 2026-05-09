; DESCRIPTION: Draws a blue rectangle at (65, 127) with width 108 and height 62.
; PLAN: r0=65(x), r1=127(y), r2=108(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 127
LDI r2, 108
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
