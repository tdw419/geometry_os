; DESCRIPTION: Draws a white rectangle at (162, 68) with width 18 and height 60.
; PLAN: r0=162(x), r1=68(y), r2=18(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 68
LDI r2, 18
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
