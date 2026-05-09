; DESCRIPTION: Draws a green rectangle at (61, 27) with width 17 and height 105.
; PLAN: r0=61(x), r1=27(y), r2=17(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 27
LDI r2, 17
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
