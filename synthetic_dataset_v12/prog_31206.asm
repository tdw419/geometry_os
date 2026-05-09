; DESCRIPTION: Draws a green rectangle at (176, 43) with width 39 and height 109.
; PLAN: r0=176(x), r1=43(y), r2=39(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 43
LDI r2, 39
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
