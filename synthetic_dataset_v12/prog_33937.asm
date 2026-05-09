; DESCRIPTION: Draws a black rectangle at (29, 71) with width 117 and height 90.
; PLAN: r0=29(x), r1=71(y), r2=117(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 71
LDI r2, 117
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
