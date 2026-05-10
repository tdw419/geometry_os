; DESCRIPTION: Draws a black rectangle at (241, 89) with width 67 and height 90.
; PLAN: r0=241(x), r1=89(y), r2=67(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 89
LDI r2, 67
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
