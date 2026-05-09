; DESCRIPTION: Draws a yellow rectangle at (87, 138) with width 104 and height 12.
; PLAN: r0=87(x), r1=138(y), r2=104(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 138
LDI r2, 104
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
