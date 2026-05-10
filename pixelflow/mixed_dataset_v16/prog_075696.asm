; DESCRIPTION: Draws a black rectangle at (225, 38) with width 116 and height 96.
; PLAN: r0=225(x), r1=38(y), r2=116(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 38
LDI r2, 116
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
