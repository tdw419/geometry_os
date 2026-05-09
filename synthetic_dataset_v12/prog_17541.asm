; DESCRIPTION: Draws a white rectangle at (288, 139) with width 23 and height 92.
; PLAN: r0=288(x), r1=139(y), r2=23(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 139
LDI r2, 23
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
