; DESCRIPTION: Draws a yellow rectangle at (403, 170) with width 81 and height 60.
; PLAN: r0=403(x), r1=170(y), r2=81(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 170
LDI r2, 81
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
