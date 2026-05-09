; DESCRIPTION: Draws a yellow rectangle at (165, 204) with width 91 and height 28.
; PLAN: r0=165(x), r1=204(y), r2=91(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 204
LDI r2, 91
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
