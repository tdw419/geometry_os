; DESCRIPTION: Draws a yellow rectangle at (95, 46) with width 13 and height 46.
; PLAN: r0=95(x), r1=46(y), r2=13(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 46
LDI r2, 13
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
