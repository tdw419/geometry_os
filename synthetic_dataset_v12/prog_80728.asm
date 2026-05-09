; DESCRIPTION: Draws a black rectangle at (224, 124) with width 99 and height 77.
; PLAN: r0=224(x), r1=124(y), r2=99(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 124
LDI r2, 99
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
