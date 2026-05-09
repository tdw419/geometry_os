; DESCRIPTION: Draws a blue rectangle at (166, 192) with width 12 and height 57.
; PLAN: r0=166(x), r1=192(y), r2=12(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 192
LDI r2, 12
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
