; DESCRIPTION: Draws a white rectangle at (192, 106) with width 39 and height 36.
; PLAN: r0=192(x), r1=106(y), r2=39(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 106
LDI r2, 39
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
