; DESCRIPTION: Draws a white rectangle at (377, 194) with width 33 and height 15.
; PLAN: r0=377(x), r1=194(y), r2=33(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 194
LDI r2, 33
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
