; DESCRIPTION: Draws a black rectangle at (92, 35) with width 99 and height 46.
; PLAN: r0=92(x), r1=35(y), r2=99(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 35
LDI r2, 99
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
