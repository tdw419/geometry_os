; DESCRIPTION: Draws a black rectangle at (222, 138) with width 42 and height 110.
; PLAN: r0=222(x), r1=138(y), r2=42(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 138
LDI r2, 42
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
