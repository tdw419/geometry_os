; DESCRIPTION: Draws a yellow rectangle at (53, 95) with width 27 and height 84.
; PLAN: r0=53(x), r1=95(y), r2=27(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 95
LDI r2, 27
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
