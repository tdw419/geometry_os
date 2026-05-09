; DESCRIPTION: Draws a cyan rectangle at (369, 16) with width 84 and height 88.
; PLAN: r0=369(x), r1=16(y), r2=84(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 16
LDI r2, 84
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
