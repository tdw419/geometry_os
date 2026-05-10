; DESCRIPTION: Draws a yellow rectangle at (321, 55) with width 111 and height 68.
; PLAN: r0=321(x), r1=55(y), r2=111(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 55
LDI r2, 111
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
