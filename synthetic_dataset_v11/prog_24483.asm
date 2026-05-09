; DESCRIPTION: Draws a black rectangle at (69, 209) with width 71 and height 22.
; PLAN: r0=69(x), r1=209(y), r2=71(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 209
LDI r2, 71
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
