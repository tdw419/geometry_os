; DESCRIPTION: Draws a green rectangle at (76, 144) with width 38 and height 12.
; PLAN: r0=76(x), r1=144(y), r2=38(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 144
LDI r2, 38
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
