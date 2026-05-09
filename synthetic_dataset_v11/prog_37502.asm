; DESCRIPTION: Draws a yellow rectangle at (76, 79) with width 56 and height 96.
; PLAN: r0=76(x), r1=79(y), r2=56(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 79
LDI r2, 56
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
