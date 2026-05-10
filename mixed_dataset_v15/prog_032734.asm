; DESCRIPTION: Draws a orange rectangle at (224, 192) with width 88 and height 83.
; PLAN: r0=224(x), r1=192(y), r2=88(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 192
LDI r2, 88
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
