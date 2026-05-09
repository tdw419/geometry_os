; DESCRIPTION: Draws a yellow rectangle at (233, 60) with width 19 and height 82.
; PLAN: r0=233(x), r1=60(y), r2=19(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 60
LDI r2, 19
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
