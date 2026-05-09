; DESCRIPTION: Draws a green rectangle at (381, 151) with width 27 and height 100.
; PLAN: r0=381(x), r1=151(y), r2=27(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 151
LDI r2, 27
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
