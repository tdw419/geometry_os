; DESCRIPTION: Draws a white rectangle at (206, 139) with width 37 and height 55.
; PLAN: r0=206(x), r1=139(y), r2=37(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 139
LDI r2, 37
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
