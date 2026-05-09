; DESCRIPTION: Draws a yellow rectangle at (28, 33) with width 52 and height 102.
; PLAN: r0=28(x), r1=33(y), r2=52(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 33
LDI r2, 52
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
