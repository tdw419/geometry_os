; DESCRIPTION: Draws a yellow rectangle at (339, 33) with width 102 and height 120.
; PLAN: r0=339(x), r1=33(y), r2=102(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 33
LDI r2, 102
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
