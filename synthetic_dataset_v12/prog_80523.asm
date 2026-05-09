; DESCRIPTION: Draws a white rectangle at (176, 65) with width 38 and height 28.
; PLAN: r0=176(x), r1=65(y), r2=38(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 65
LDI r2, 38
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
