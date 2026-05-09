; DESCRIPTION: Draws a yellow rectangle at (362, 102) with width 28 and height 68.
; PLAN: r0=362(x), r1=102(y), r2=28(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 102
LDI r2, 28
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
