; DESCRIPTION: Draws a white rectangle at (163, 136) with width 84 and height 42.
; PLAN: r0=163(x), r1=136(y), r2=84(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 136
LDI r2, 84
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
