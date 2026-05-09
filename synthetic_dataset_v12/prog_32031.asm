; DESCRIPTION: Draws a yellow rectangle at (355, 34) with width 28 and height 104.
; PLAN: r0=355(x), r1=34(y), r2=28(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 34
LDI r2, 28
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
