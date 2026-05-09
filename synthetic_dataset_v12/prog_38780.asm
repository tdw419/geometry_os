; DESCRIPTION: Draws a white rectangle at (53, 224) with width 86 and height 32.
; PLAN: r0=53(x), r1=224(y), r2=86(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 224
LDI r2, 86
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
