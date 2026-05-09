; DESCRIPTION: Draws a blue rectangle at (58, 213) with width 88 and height 31.
; PLAN: r0=58(x), r1=213(y), r2=88(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 213
LDI r2, 88
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
