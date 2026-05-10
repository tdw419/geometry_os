; DESCRIPTION: Draws a black rectangle at (225, 81) with width 55 and height 24.
; PLAN: r0=225(x), r1=81(y), r2=55(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 81
LDI r2, 55
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
