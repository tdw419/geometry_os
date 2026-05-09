; DESCRIPTION: Draws a white rectangle at (320, 22) with width 57 and height 87.
; PLAN: r0=320(x), r1=22(y), r2=57(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 22
LDI r2, 57
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
