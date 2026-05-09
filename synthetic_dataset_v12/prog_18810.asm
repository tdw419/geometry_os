; DESCRIPTION: Draws a blue rectangle at (76, 154) with width 77 and height 78.
; PLAN: r0=76(x), r1=154(y), r2=77(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 154
LDI r2, 77
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
