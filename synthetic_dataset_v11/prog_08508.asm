; DESCRIPTION: Draws a blue rectangle at (123, 154) with width 87 and height 88.
; PLAN: r0=123(x), r1=154(y), r2=87(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 154
LDI r2, 87
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
