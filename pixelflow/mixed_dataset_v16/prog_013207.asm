; DESCRIPTION: Draws a yellow rectangle at (203, 87) with width 116 and height 46.
; PLAN: r0=203(x), r1=87(y), r2=116(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 87
LDI r2, 116
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
