; DESCRIPTION: Draws a red rectangle at (46, 88) with width 11 and height 103.
; PLAN: r0=46(x), r1=88(y), r2=11(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 88
LDI r2, 11
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
