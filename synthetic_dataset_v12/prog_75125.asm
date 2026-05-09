; DESCRIPTION: Draws a yellow rectangle at (189, 2) with width 55 and height 102.
; PLAN: r0=189(x), r1=2(y), r2=55(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 2
LDI r2, 55
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
