; DESCRIPTION: Draws a yellow rectangle at (11, 143) with width 95 and height 78.
; PLAN: r0=11(x), r1=143(y), r2=95(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 143
LDI r2, 95
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
