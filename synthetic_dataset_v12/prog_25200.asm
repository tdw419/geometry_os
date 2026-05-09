; DESCRIPTION: Draws a green rectangle at (344, 164) with width 99 and height 40.
; PLAN: r0=344(x), r1=164(y), r2=99(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 164
LDI r2, 99
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
