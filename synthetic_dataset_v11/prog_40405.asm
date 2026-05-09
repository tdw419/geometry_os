; DESCRIPTION: Draws a green rectangle at (97, 151) with width 43 and height 27.
; PLAN: r0=97(x), r1=151(y), r2=43(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 151
LDI r2, 43
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
