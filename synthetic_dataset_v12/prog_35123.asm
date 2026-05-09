; DESCRIPTION: Draws a white rectangle at (230, 6) with width 33 and height 10.
; PLAN: r0=230(x), r1=6(y), r2=33(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 6
LDI r2, 33
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
