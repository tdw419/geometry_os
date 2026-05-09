; DESCRIPTION: Draws a blue rectangle at (166, 68) with width 90 and height 55.
; PLAN: r0=166(x), r1=68(y), r2=90(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 68
LDI r2, 90
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
