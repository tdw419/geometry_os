; DESCRIPTION: Draws a yellow rectangle at (38, 35) with width 60 and height 113.
; PLAN: r0=38(x), r1=35(y), r2=60(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 35
LDI r2, 60
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
