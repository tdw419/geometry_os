; DESCRIPTION: Draws a purple rectangle at (224, 4) with width 23 and height 70.
; PLAN: r0=224(x), r1=4(y), r2=23(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 4
LDI r2, 23
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
