; DESCRIPTION: Draws a white rectangle at (14, 28) with width 33 and height 23.
; PLAN: r0=14(x), r1=28(y), r2=33(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 28
LDI r2, 33
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
