; DESCRIPTION: Draws a yellow rectangle at (344, 165) with width 48 and height 14.
; PLAN: r0=344(x), r1=165(y), r2=48(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 165
LDI r2, 48
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
