; DESCRIPTION: Draws a blue rectangle at (406, 98) with width 104 and height 88.
; PLAN: r0=406(x), r1=98(y), r2=104(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 98
LDI r2, 104
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
