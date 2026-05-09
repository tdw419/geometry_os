; DESCRIPTION: Draws a black rectangle at (152, 6) with width 84 and height 60.
; PLAN: r0=152(x), r1=6(y), r2=84(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 6
LDI r2, 84
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
