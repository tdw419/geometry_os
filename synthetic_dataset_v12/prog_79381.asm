; DESCRIPTION: Draws a yellow rectangle at (380, 2) with width 100 and height 36.
; PLAN: r0=380(x), r1=2(y), r2=100(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 2
LDI r2, 100
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
