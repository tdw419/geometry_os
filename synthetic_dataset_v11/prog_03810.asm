; DESCRIPTION: Draws a green rectangle at (144, 133) with width 26 and height 93.
; PLAN: r0=144(x), r1=133(y), r2=26(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 133
LDI r2, 26
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
