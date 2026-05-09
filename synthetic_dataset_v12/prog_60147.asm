; DESCRIPTION: Draws a green rectangle at (224, 8) with width 84 and height 79.
; PLAN: r0=224(x), r1=8(y), r2=84(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 8
LDI r2, 84
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
