; DESCRIPTION: Draws a cyan rectangle at (163, 73) with width 96 and height 15.
; PLAN: r0=163(x), r1=73(y), r2=96(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 73
LDI r2, 96
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
