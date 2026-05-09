; DESCRIPTION: Draws a yellow rectangle at (61, 224) with width 56 and height 11.
; PLAN: r0=61(x), r1=224(y), r2=56(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 224
LDI r2, 56
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
