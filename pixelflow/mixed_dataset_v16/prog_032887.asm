; DESCRIPTION: Draws a white rectangle at (281, 176) with width 43 and height 29.
; PLAN: r0=281(x), r1=176(y), r2=43(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 176
LDI r2, 43
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
