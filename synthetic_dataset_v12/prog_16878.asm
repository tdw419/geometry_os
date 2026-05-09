; DESCRIPTION: Draws a green rectangle at (278, 196) with width 62 and height 52.
; PLAN: r0=278(x), r1=196(y), r2=62(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 196
LDI r2, 62
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
