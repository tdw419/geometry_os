; DESCRIPTION: Draws a blue rectangle at (92, 11) with width 14 and height 38.
; PLAN: r0=92(x), r1=11(y), r2=14(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 11
LDI r2, 14
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
