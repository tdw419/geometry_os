; DESCRIPTION: Draws a black rectangle at (135, 31) with width 92 and height 107.
; PLAN: r0=135(x), r1=31(y), r2=92(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 31
LDI r2, 92
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
