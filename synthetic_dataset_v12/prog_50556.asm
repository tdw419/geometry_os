; DESCRIPTION: Draws a blue rectangle at (154, 60) with width 68 and height 88.
; PLAN: r0=154(x), r1=60(y), r2=68(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 60
LDI r2, 68
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
