; DESCRIPTION: Draws a blue rectangle at (414, 22) with width 14 and height 72.
; PLAN: r0=414(x), r1=22(y), r2=14(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 22
LDI r2, 14
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
