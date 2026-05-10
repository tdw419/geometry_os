; DESCRIPTION: Draws a yellow rectangle at (214, 76) with width 72 and height 84.
; PLAN: r0=214(x), r1=76(y), r2=72(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 76
LDI r2, 72
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
