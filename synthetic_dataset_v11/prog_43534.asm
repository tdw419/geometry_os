; DESCRIPTION: Draws a blue rectangle at (92, 100) with width 27 and height 17.
; PLAN: r0=92(x), r1=100(y), r2=27(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 100
LDI r2, 27
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
