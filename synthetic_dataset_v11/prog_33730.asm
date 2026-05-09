; DESCRIPTION: Draws a blue rectangle at (9, 98) with width 56 and height 92.
; PLAN: r0=9(x), r1=98(y), r2=56(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 98
LDI r2, 56
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
