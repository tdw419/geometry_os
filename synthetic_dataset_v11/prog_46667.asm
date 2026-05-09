; DESCRIPTION: Draws a yellow rectangle at (107, 55) with width 104 and height 26.
; PLAN: r0=107(x), r1=55(y), r2=104(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 55
LDI r2, 104
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
