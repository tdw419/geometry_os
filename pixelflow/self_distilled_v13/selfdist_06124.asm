; DESCRIPTION: Draws a yellow rectangle at (154, 35) with width 14 and height 28.
; PLAN: r0=154(x), r1=35(y), r2=14(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 35
LDI r2, 14
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
