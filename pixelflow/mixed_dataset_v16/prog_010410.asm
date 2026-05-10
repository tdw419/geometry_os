; DESCRIPTION: Draws a purple rectangle at (224, 112) with width 39 and height 12.
; PLAN: r0=224(x), r1=112(y), r2=39(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 112
LDI r2, 39
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
