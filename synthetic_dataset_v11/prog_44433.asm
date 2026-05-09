; DESCRIPTION: Draws a white rectangle at (45, 8) with width 35 and height 25.
; PLAN: r0=45(x), r1=8(y), r2=35(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 8
LDI r2, 35
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
