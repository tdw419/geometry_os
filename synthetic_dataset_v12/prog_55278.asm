; DESCRIPTION: Draws a yellow rectangle at (374, 81) with width 69 and height 109.
; PLAN: r0=374(x), r1=81(y), r2=69(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 81
LDI r2, 69
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
