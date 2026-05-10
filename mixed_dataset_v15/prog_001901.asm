; DESCRIPTION: Draws a yellow rectangle at (251, 69) with width 42 and height 101.
; PLAN: r0=251(x), r1=69(y), r2=42(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 69
LDI r2, 42
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
