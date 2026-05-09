; DESCRIPTION: Draws a yellow rectangle at (45, 69) with width 71 and height 90.
; PLAN: r0=45(x), r1=69(y), r2=71(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 69
LDI r2, 71
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
