; DESCRIPTION: Draws a yellow rectangle at (47, 133) with width 14 and height 109.
; PLAN: r0=47(x), r1=133(y), r2=14(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 133
LDI r2, 14
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
