; DESCRIPTION: Draws a blue rectangle at (38, 176) with width 97 and height 45.
; PLAN: r0=38(x), r1=176(y), r2=97(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 176
LDI r2, 97
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
