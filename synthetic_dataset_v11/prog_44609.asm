; DESCRIPTION: Draws a white rectangle at (31, 192) with width 113 and height 34.
; PLAN: r0=31(x), r1=192(y), r2=113(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 192
LDI r2, 113
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
