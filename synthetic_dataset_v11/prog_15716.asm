; DESCRIPTION: Draws a yellow rectangle at (130, 142) with width 61 and height 104.
; PLAN: r0=130(x), r1=142(y), r2=61(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 142
LDI r2, 61
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
