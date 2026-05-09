; DESCRIPTION: Draws a white rectangle at (224, 63) with width 74 and height 101.
; PLAN: r0=224(x), r1=63(y), r2=74(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 63
LDI r2, 74
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
