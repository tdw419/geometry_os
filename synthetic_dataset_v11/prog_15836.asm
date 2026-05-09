; DESCRIPTION: Draws a white rectangle at (77, 14) with width 111 and height 69.
; PLAN: r0=77(x), r1=14(y), r2=111(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 14
LDI r2, 111
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
