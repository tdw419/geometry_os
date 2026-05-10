; DESCRIPTION: Draws a yellow rectangle at (71, 148) with width 28 and height 90.
; PLAN: r0=71(x), r1=148(y), r2=28(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 148
LDI r2, 28
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
