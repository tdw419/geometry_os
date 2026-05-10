; DESCRIPTION: Draws a yellow rectangle at (64, 116) with width 46 and height 100.
; PLAN: r0=64(x), r1=116(y), r2=46(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 116
LDI r2, 46
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
