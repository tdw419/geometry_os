; DESCRIPTION: Draws a white rectangle at (255, 188) with width 56 and height 92.
; PLAN: r0=255(x), r1=188(y), r2=56(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 188
LDI r2, 56
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
