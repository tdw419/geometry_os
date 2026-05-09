; DESCRIPTION: Draws a white rectangle at (390, 29) with width 61 and height 68.
; PLAN: r0=390(x), r1=29(y), r2=61(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 29
LDI r2, 61
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
