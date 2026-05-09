; DESCRIPTION: Draws a white rectangle at (138, 76) with width 64 and height 33.
; PLAN: r0=138(x), r1=76(y), r2=64(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 76
LDI r2, 64
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
