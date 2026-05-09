; DESCRIPTION: Draws a black rectangle at (12, 37) with width 107 and height 55.
; PLAN: r0=12(x), r1=37(y), r2=107(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 37
LDI r2, 107
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
