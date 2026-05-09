; DESCRIPTION: Draws a yellow rectangle at (69, 27) with width 104 and height 52.
; PLAN: r0=69(x), r1=27(y), r2=104(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 27
LDI r2, 104
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
