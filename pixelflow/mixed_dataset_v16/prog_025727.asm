; DESCRIPTION: Draws a red rectangle at (198, 25) with width 62 and height 101.
; PLAN: r0=198(x), r1=25(y), r2=62(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 25
LDI r2, 62
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
