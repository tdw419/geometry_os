; DESCRIPTION: Draws a yellow rectangle at (128, 121) with width 100 and height 112.
; PLAN: r0=128(x), r1=121(y), r2=100(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 121
LDI r2, 100
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
