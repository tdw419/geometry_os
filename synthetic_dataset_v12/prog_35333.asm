; DESCRIPTION: Draws a black rectangle at (344, 16) with width 75 and height 36.
; PLAN: r0=344(x), r1=16(y), r2=75(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 16
LDI r2, 75
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
