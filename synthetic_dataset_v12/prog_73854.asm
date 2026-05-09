; DESCRIPTION: Draws a yellow rectangle at (403, 104) with width 62 and height 118.
; PLAN: r0=403(x), r1=104(y), r2=62(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 104
LDI r2, 62
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
