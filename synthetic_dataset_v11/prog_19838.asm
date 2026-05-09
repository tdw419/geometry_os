; DESCRIPTION: Draws a blue rectangle at (92, 166) with width 117 and height 56.
; PLAN: r0=92(x), r1=166(y), r2=117(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 166
LDI r2, 117
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
