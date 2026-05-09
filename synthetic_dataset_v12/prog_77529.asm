; DESCRIPTION: Draws a yellow rectangle at (233, 5) with width 113 and height 60.
; PLAN: r0=233(x), r1=5(y), r2=113(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 5
LDI r2, 113
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
