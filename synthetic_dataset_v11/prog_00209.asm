; DESCRIPTION: Draws a purple rectangle at (224, 45) with width 29 and height 85.
; PLAN: r0=224(x), r1=45(y), r2=29(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 45
LDI r2, 29
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
