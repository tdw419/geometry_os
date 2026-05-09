; DESCRIPTION: Draws a black rectangle at (152, 14) with width 11 and height 25.
; PLAN: r0=152(x), r1=14(y), r2=11(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 14
LDI r2, 11
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
