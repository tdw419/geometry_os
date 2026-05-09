; DESCRIPTION: Draws a blue rectangle at (13, 224) with width 80 and height 10.
; PLAN: r0=13(x), r1=224(y), r2=80(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 224
LDI r2, 80
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
