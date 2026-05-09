; DESCRIPTION: Draws a blue rectangle at (332, 186) with width 59 and height 62.
; PLAN: r0=332(x), r1=186(y), r2=59(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 186
LDI r2, 59
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
