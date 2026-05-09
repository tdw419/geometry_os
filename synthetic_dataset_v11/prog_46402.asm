; DESCRIPTION: Draws a black rectangle at (12, 174) with width 33 and height 14.
; PLAN: r0=12(x), r1=174(y), r2=33(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 174
LDI r2, 33
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
