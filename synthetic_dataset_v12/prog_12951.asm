; DESCRIPTION: Draws a green rectangle at (336, 151) with width 66 and height 91.
; PLAN: r0=336(x), r1=151(y), r2=66(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 151
LDI r2, 66
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
