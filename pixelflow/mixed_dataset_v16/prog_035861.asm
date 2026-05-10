; DESCRIPTION: Draws a white rectangle at (183, 151) with width 33 and height 108.
; PLAN: r0=183(x), r1=151(y), r2=33(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 151
LDI r2, 33
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
