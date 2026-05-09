; DESCRIPTION: Draws a white rectangle at (211, 86) with width 78 and height 59.
; PLAN: r0=211(x), r1=86(y), r2=78(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 86
LDI r2, 78
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
