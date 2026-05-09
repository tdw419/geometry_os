; DESCRIPTION: Draws a orange rectangle at (455, 138) with width 11 and height 42.
; PLAN: r0=455(x), r1=138(y), r2=11(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 138
LDI r2, 11
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
