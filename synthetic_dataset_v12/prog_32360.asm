; DESCRIPTION: Draws a blue rectangle at (207, 144) with width 76 and height 34.
; PLAN: r0=207(x), r1=144(y), r2=76(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 144
LDI r2, 76
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
