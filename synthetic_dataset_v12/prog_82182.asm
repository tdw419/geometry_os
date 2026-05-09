; DESCRIPTION: Draws a yellow rectangle at (214, 63) with width 102 and height 95.
; PLAN: r0=214(x), r1=63(y), r2=102(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 63
LDI r2, 102
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
