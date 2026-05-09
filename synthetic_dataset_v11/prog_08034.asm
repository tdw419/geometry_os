; DESCRIPTION: Draws a white rectangle at (224, 128) with width 19 and height 90.
; PLAN: r0=224(x), r1=128(y), r2=19(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 128
LDI r2, 19
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
