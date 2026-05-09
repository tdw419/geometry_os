; DESCRIPTION: Draws a yellow rectangle at (374, 1) with width 116 and height 37.
; PLAN: r0=374(x), r1=1(y), r2=116(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 1
LDI r2, 116
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
