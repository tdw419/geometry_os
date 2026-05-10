; DESCRIPTION: Draws a black rectangle at (174, 123) with width 45 and height 65.
; PLAN: r0=174(x), r1=123(y), r2=45(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 123
LDI r2, 45
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
