; DESCRIPTION: Draws a yellow rectangle at (19, 85) with width 38 and height 82.
; PLAN: r0=19(x), r1=85(y), r2=38(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 85
LDI r2, 38
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
