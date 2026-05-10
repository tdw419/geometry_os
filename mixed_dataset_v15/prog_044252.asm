; DESCRIPTION: Draws a blue rectangle at (402, 22) with width 42 and height 69.
; PLAN: r0=402(x), r1=22(y), r2=42(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 22
LDI r2, 42
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
