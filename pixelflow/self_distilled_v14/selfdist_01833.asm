; DESCRIPTION: Draws a green rectangle at (364, 93) with width 108 and height 26.
; PLAN: r0=364(x), r1=93(y), r2=108(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 93
LDI r2, 108
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
