; DESCRIPTION: Draws a blue rectangle at (280, 131) with width 41 and height 104.
; PLAN: r0=280(x), r1=131(y), r2=41(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 131
LDI r2, 41
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
