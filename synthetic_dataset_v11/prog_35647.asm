; DESCRIPTION: Draws a black rectangle at (215, 125) with width 28 and height 104.
; PLAN: r0=215(x), r1=125(y), r2=28(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 125
LDI r2, 28
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
