; DESCRIPTION: Draws a green rectangle at (238, 192) with width 113 and height 38.
; PLAN: r0=238(x), r1=192(y), r2=113(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 192
LDI r2, 113
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
