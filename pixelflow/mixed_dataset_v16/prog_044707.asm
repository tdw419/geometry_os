; DESCRIPTION: Draws a yellow rectangle at (3, 69) with width 82 and height 65.
; PLAN: r0=3(x), r1=69(y), r2=82(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 69
LDI r2, 82
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
