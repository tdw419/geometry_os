; DESCRIPTION: Draws a black rectangle at (220, 37) with width 113 and height 92.
; PLAN: r0=220(x), r1=37(y), r2=113(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 37
LDI r2, 113
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
