; DESCRIPTION: Draws a white rectangle at (224, 206) with width 12 and height 25.
; PLAN: r0=224(x), r1=206(y), r2=12(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 206
LDI r2, 12
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
