; DESCRIPTION: Draws a white rectangle at (309, 151) with width 110 and height 28.
; PLAN: r0=309(x), r1=151(y), r2=110(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 151
LDI r2, 110
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
