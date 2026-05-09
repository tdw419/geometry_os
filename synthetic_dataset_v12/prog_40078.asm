; DESCRIPTION: Draws a red rectangle at (92, 4) with width 13 and height 110.
; PLAN: r0=92(x), r1=4(y), r2=13(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 4
LDI r2, 13
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
