; DESCRIPTION: Draws a green rectangle at (266, 150) with width 38 and height 16.
; PLAN: r0=266(x), r1=150(y), r2=38(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 150
LDI r2, 38
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
