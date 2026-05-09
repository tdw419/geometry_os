; DESCRIPTION: Draws a white rectangle at (135, 148) with width 38 and height 35.
; PLAN: r0=135(x), r1=148(y), r2=38(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 148
LDI r2, 38
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
