; DESCRIPTION: Draws a yellow rectangle at (370, 33) with width 113 and height 36.
; PLAN: r0=370(x), r1=33(y), r2=113(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 33
LDI r2, 113
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
