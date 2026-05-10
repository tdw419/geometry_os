; DESCRIPTION: Draws a green rectangle at (92, 55) with width 110 and height 57.
; PLAN: r0=92(x), r1=55(y), r2=110(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 55
LDI r2, 110
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
