; DESCRIPTION: Draws a black rectangle at (37, 8) with width 102 and height 27.
; PLAN: r0=37(x), r1=8(y), r2=102(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 8
LDI r2, 102
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
