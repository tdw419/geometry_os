; DESCRIPTION: Draws a yellow rectangle at (45, 59) with width 104 and height 24.
; PLAN: r0=45(x), r1=59(y), r2=104(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 59
LDI r2, 104
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
