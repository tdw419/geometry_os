; DESCRIPTION: Draws a white rectangle at (208, 62) with width 17 and height 113.
; PLAN: r0=208(x), r1=62(y), r2=17(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 62
LDI r2, 17
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
