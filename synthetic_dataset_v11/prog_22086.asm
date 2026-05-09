; DESCRIPTION: Draws a green rectangle at (172, 206) with width 29 and height 28.
; PLAN: r0=172(x), r1=206(y), r2=29(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 206
LDI r2, 29
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
