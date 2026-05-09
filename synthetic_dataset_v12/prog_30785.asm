; DESCRIPTION: Draws a white rectangle at (62, 94) with width 16 and height 56.
; PLAN: r0=62(x), r1=94(y), r2=16(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 94
LDI r2, 16
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
