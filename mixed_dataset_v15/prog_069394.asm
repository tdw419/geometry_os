; DESCRIPTION: Draws a white rectangle at (249, 154) with width 15 and height 29.
; PLAN: r0=249(x), r1=154(y), r2=15(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 154
LDI r2, 15
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
