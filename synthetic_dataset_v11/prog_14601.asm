; DESCRIPTION: Draws a red rectangle at (39, 198) with width 25 and height 36.
; PLAN: r0=39(x), r1=198(y), r2=25(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 198
LDI r2, 25
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
