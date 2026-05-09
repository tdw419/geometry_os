; DESCRIPTION: Draws a yellow rectangle at (182, 126) with width 54 and height 11.
; PLAN: r0=182(x), r1=126(y), r2=54(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 126
LDI r2, 54
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
