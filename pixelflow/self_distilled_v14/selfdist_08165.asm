; DESCRIPTION: Draws a yellow rectangle at (0, 148) with width 33 and height 113.
; PLAN: r0=0(x), r1=148(y), r2=33(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 148
LDI r2, 33
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
