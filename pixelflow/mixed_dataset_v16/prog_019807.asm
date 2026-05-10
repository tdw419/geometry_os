; DESCRIPTION: Draws a cyan rectangle at (194, 67) with width 51 and height 101.
; PLAN: r0=194(x), r1=67(y), r2=51(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 67
LDI r2, 51
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
