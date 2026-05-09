; DESCRIPTION: Draws a green rectangle at (108, 71) with width 90 and height 62.
; PLAN: r0=108(x), r1=71(y), r2=90(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 71
LDI r2, 90
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
