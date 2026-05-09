; DESCRIPTION: Draws a blue rectangle at (65, 224) with width 79 and height 31.
; PLAN: r0=65(x), r1=224(y), r2=79(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 224
LDI r2, 79
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
