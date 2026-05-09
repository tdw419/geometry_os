; DESCRIPTION: Draws a green rectangle at (334, 121) with width 40 and height 10.
; PLAN: r0=334(x), r1=121(y), r2=40(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 121
LDI r2, 40
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
