; DESCRIPTION: Draws a blue rectangle at (412, 68) with width 100 and height 65.
; PLAN: r0=412(x), r1=68(y), r2=100(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 68
LDI r2, 100
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
