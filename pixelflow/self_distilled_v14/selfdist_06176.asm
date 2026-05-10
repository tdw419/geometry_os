; DESCRIPTION: Draws a green rectangle at (34, 162) with width 64 and height 25.
; PLAN: r0=34(x), r1=162(y), r2=64(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 162
LDI r2, 64
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
