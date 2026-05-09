; DESCRIPTION: Draws a blue rectangle at (341, 104) with width 41 and height 42.
; PLAN: r0=341(x), r1=104(y), r2=41(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 104
LDI r2, 41
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
