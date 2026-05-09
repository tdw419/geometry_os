; DESCRIPTION: Draws a green rectangle at (34, 115) with width 68 and height 104.
; PLAN: r0=34(x), r1=115(y), r2=68(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 115
LDI r2, 68
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
