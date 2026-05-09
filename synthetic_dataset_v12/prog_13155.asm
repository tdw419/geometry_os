; DESCRIPTION: Draws a green rectangle at (239, 81) with width 44 and height 61.
; PLAN: r0=239(x), r1=81(y), r2=44(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 81
LDI r2, 44
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
