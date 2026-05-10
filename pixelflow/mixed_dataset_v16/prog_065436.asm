; DESCRIPTION: Draws a yellow rectangle at (156, 46) with width 69 and height 79.
; PLAN: r0=156(x), r1=46(y), r2=69(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 46
LDI r2, 69
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
