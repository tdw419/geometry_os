; DESCRIPTION: Draws a black rectangle at (11, 119) with width 91 and height 42.
; PLAN: r0=11(x), r1=119(y), r2=91(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 119
LDI r2, 91
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
