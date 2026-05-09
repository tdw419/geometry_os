; DESCRIPTION: Draws a green rectangle at (206, 192) with width 71 and height 35.
; PLAN: r0=206(x), r1=192(y), r2=71(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 192
LDI r2, 71
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
